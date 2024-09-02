//
//  Post.swift
//  AsyncProgramming
//
//  Created by Sridhar on 31/08/2024.
//

import Foundation

struct Todo: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

