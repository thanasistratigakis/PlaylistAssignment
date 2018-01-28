//
//  PostDescriptionViewController.swift
//  PlaylistAssignment
//
//  Created by Thanasi Stratigakis on 1/26/18.
//  Copyright © 2018 thanasistratigakis. All rights reserved.
//

import UIKit

class PostDescriptionViewController: UIViewController {

    var post: Post?
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        descriptionLabel.text = post?.body
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }

}
