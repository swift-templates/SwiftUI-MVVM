//
//  AppNavigationView.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import SwiftUI

struct AppNavigationView: View {
    @StateObject var viewModel: AppViewModel
    var body: some View {
        NavigationStack(path: $viewModel.navStack) {
            AsyncLoaderView(loader: viewModel.loader, loadingViewBuilder: {
                ProgressView()
            }) { indexItems in
                ContentIndexView(listData: indexItems)
            }
                .navigationTitle(viewModel.navTitle)
                .navigationDestination(for: NavItem.self) { navItem in
                    switch navItem {
                    case .contentDetail:
                        contentDetail
                    case .contentIndex:
                        contentIndex
                    }
                }
        }
    }

    var contentDetail: some View {
        VStack {
            Text("content detail")
                .navigationTitle("Content Detail")
        }
    }

    var contentIndex: some View {
        ProgressView("Loading articles")
    }
}

#Preview {
    AppNavigationView(viewModel: AppViewModel())
}
