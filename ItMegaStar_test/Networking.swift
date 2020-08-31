//
//  Networking.swift
//  ItMegaStar_test
//
//  Created by Максим Солнцев on 8/27/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import Foundation


class NetworkManager {
    
    var numberOfPage = 1
    var postArray: [PostResponse] = []
    var commentsArray: [CommentsResponse] = []
    
    func fetchPosts(complitionHandler: @escaping ([PostResponse]) -> ()) {
        
         let urlString = "http://jsonplaceholder.typicode.com/posts?_page=\(numberOfPage))"
        guard let url = URL(string: urlString) else {return}
        
         URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let postList: [PostResponse]
                postList = try JSONDecoder().decode([PostResponse].self, from: data)
                self.postArray += postList
                complitionHandler(self.postArray)
            } catch {
                print(error)
            }
        }
         .resume()
    }
    
   
    func fetchComments(posId: Int ,complitionHandler: @escaping ([CommentsResponse]) -> ()) {
        
        let urlString = "https://jsonplaceholder.typicode.com/posts/\(posId)/comments"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let commentsList: [CommentsResponse]
                commentsList = try JSONDecoder().decode([CommentsResponse].self, from: data)
                complitionHandler(commentsList)
            } catch {
                print(error)
            }
        }
        .resume()
    }
}


