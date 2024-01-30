//
//  SwiftUI_MVVMApp.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 19/01/24.
//

import SwiftUI

@main
struct SwiftUI_MVVMApp: App {
    @StateObject var appViewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            AppNavigationView(viewModel: appViewModel)
                .task {
                    await appViewModel.loader.loadIfNeeded()
                }
        }
    }
}
