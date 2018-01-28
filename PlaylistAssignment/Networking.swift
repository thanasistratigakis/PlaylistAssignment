//
//  Networking.swift
//  PlaylistAssignment
//
//  Created by Thanasi Stratigakis on 1/26/18.
//  Copyright © 2018 thanasistratigakis. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

final class Networking {
    
    static let shared = Networking()
    
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func fetchPosts(page: Int, limit: Int, completion: @escaping ([Post]) -> ()) {
        let urlString = baseURL + "posts" + "?_page=" + String(page) + "&_limit=" + String(limit)
        guard let url = URL(string: urlString) else { return }
        print("page:", page)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let postsArray = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(postsArray)
                }
            } catch let jsonErr{
                print("Error serializing:", jsonErr)
            }
        }.resume()
    }
    
}



