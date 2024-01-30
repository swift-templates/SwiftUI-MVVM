//
//  AsyncLoader.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import Foundation
import Combine

class AsyncLoader<Model>: ObservableObject {
    enum State {
        case notStarted
        case loading
        case content(Model)
        case failure(Error)

        var isLoading: Bool {
            guard case .loading = self else {
                return false
            }
            return true
        }
    }

    @Published private(set) var state: State = .notStarted
    private let loader: () async throws -> Model

    init(loader: @escaping () async throws -> Model) {
        self.loader = loader
    }

    func load() async {
        // avoiding concurrent load call
        guard !state.isLoading else {
            return
        }

        do {
            state = .loading
            let result = try await loader()
            state = .content(result)
        } catch {
            state = .failure(error)
        }
    }

    func reload() async {
        state = .notStarted
        await load()
    }

    func loadIfNeeded() async {
        switch state {
        case .notStarted, .failure:
            await reload()
        default:
            return
        }
    }
}
