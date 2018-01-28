//
//  PostsViewController.swift
//  PlaylistAssignment
//
//  Created by Thanasi Stratigakis on 1/26/18.
//  Copyright © 2018 thanasistratigakis. All rights reserved.
//

import UIKit
import SnapKit

class PostsViewController: UIViewController {
    
    var posts: [Post] = []
    
    // for pagination
    var page = 1
    let limit = 10
    let totalPostsOnServer = 100
    
    lazy var postsTableView: UITableView = { [weak self] in
        let tableView = UITableView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        Networking.shared.fetchPosts(page: self.page, limit: self.limit, completion: { (posts) in
            self.posts.append(contentsOf: posts)
            self.page += 1
            self.postsTableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        self.navigationItem.title = "Posts"
        self.view.addSubview(postsTableView)
        
        postsTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}

extension PostsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.titleLabel.text = posts[indexPath.row].title
        cell.bodyLabel.text = posts[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationViewController = PostDescriptionViewController()
        destinationViewController.post = posts[indexPath.row]
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.posts.count - 1 {
            if totalPostsOnServer > self.posts.count {
                Networking.shared.fetchPosts(page: self.page, limit: self.limit, completion: { (newPosts) in
                    self.posts.append(contentsOf: newPosts)
                    self.page += 1
                    self.postsTableView.reloadData()
                })
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}



