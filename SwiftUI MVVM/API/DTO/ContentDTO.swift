//
//  ContentDTO.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import Foundation

class ContentDTO: Decodable {
    let id: String
    let ownerId: String
    let parentId: String?
    let slug: String
    let title: String?
    let status: String
    let sourceUrl: String?
    let publishedAt: String?
    let tabcoins: Int
    let ownerUsername: String
    let childrenDeepCount: Int
    let body: String?
    var children: [ContentDTO]?
}
