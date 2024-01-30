//
//  ContentItem.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 24/01/24.
//

import Foundation

struct ContentIndexItem: Identifiable {
    let id: String
    let ownerUsername: String
    let tabcoins: Int
    let publishedAt: String
    let slug: String
    let title: String
    let childrenCount: Int

    init(id: String, ownerUsername: String, tabcoins: Int, publishedAt: String, slug: String, title: String, childrenCount: Int) {
        self.id = id
        self.ownerUsername = ownerUsername
        self.tabcoins = tabcoins
        self.publishedAt = publishedAt
        self.slug = slug
        self.title = title
        self.childrenCount = childrenCount
    }

    init(contentDTO: ContentDTO) {
        self.id = contentDTO.id
        self.ownerUsername = contentDTO.ownerUsername
        self.tabcoins = contentDTO.tabcoins
        self.publishedAt = contentDTO.publishedAt ?? ""
        self.slug = contentDTO.slug
        self.title = contentDTO.title ?? ""
        self.childrenCount = contentDTO.childrenDeepCount
    }
}
