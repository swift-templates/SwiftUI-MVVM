//
//  AsyncLoaderView.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import SwiftUI

struct AsyncLoaderView<Model, ResultView: View, LoadingView: View>: View {
    @ObservedObject var loader: AsyncLoader<Model>
    let resultViewBuilder: (_ model: Model) -> ResultView
    let loadingViewBuilder: () -> LoadingView

    init(loader: AsyncLoader<Model>,
         @ViewBuilder loadingViewBuilder: @escaping (() -> LoadingView),
         @ViewBuilder resultViewBuilder: @escaping (_: Model) -> ResultView
    ) {
        self.loader = loader
        self.loadingViewBuilder = loadingViewBuilder
        self.resultViewBuilder = resultViewBuilder
    }

    var body: some View {
        switch loader.state {
        case .notStarted, .loading:
            loadingViewBuilder()
        case .content(let model):
            resultViewBuilder(model)
        case .failure(let error):
            errorView(error)
        }
    }

    @ViewBuilder func errorView(_ error: Error) -> some View {
        Text(error.localizedDescription).bold()
            .foregroundStyle(.red)
    }
}

#Preview {
    let loader = AsyncLoader(loader: {
        return "DATA LOADED"
    })

    let loadingVB = {
        HStack(spacing: 8){
            ProgressView()
            Text("Loading data")
        }
    }

    return AsyncLoaderView(loader: loader, loadingViewBuilder: loadingVB) { result in
        Text(result)
    }
}
