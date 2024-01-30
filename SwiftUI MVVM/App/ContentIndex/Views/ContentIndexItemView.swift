//
//  ContentItemView.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import SwiftUI

struct ContentIndexItemView: View {
    let viewModel: ViewModel

    init(viewModel: ContentIndexItemView.ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(alignment: .center) {
            tabCoinCount
            VStack(alignment: .leading) {
                titleRow
                infoRow
            }
        }
    }

    var titleRow: some View {
        HStack {
            Text(viewModel.title)
                .bold()
            Spacer()
        }
    }

    var infoRow: some View {
        HStack {
            Text(viewModel.commentCountPrettyFormatted)
            Text("-")
            Text(viewModel.author)
            Text("-")
            Text(viewModel.createdDatePrettyFormatted)
            Spacer()
        }.font(.caption)
    }

    var tabCoinCount: some View {
        Text("\(viewModel.tabcoins)")
            .font(.title)
            .bold()
            .foregroundStyle(.orange)
            .padding([.leading, .bottom, .top], 16)
            .padding(.trailing, 8)
    }
}

extension ContentIndexItemView {
    struct ViewModel {
        let tabcoins: Int
        let title: String
        let commentCount: Int
        let author: String
        let createdDate: String

        var createdDatePrettyFormatted: String {
            "2 horas atrás"
        }

        var commentCountPrettyFormatted: String {
            (commentCount == 1) ? "1 comentário" : "\(commentCount) comentários"
        }
    }
}

#Preview {
    let vm = ContentIndexItemView.ViewModel(tabcoins: 5, title:"title here",  commentCount: 10, author: "Leu", createdDate: "")
    return ContentIndexItemView(viewModel: vm)
}
