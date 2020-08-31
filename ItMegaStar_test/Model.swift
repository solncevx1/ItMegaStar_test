//
//  Model.swift
//  ItMegaStar_test
//
//  Created by Максим Солнцев on 8/27/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import Foundation

struct PostResponse: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
}


struct CommentsResponse: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
