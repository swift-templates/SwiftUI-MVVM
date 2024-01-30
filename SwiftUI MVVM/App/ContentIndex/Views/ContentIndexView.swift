//
//  ContentView.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 19/01/24.
//

import SwiftUI
import Combine

struct ContentIndexView: View {
    @State var listData: [ContentIndexItem]
    var body: some View {
        List(listData) {
            ContentIndexItemView(viewModel: .init(tabcoins: $0.tabcoins,
                                             title: $0.title,
                                             commentCount: $0.childrenCount,
                                             author: $0.ownerUsername,
                                             createdDate: $0.publishedAt))

        }
    }
}

#Preview {
    let mockListData: [ContentIndexItem] = [
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu of iridia", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3),
        .init(id: UUID().uuidString, ownerUsername: "Leu", tabcoins: 2, publishedAt: "2 days", slug:"title-of-the-news", title: "Title of the news", childrenCount: 3)

    ]
    return ContentIndexView(listData: mockListData)
}
