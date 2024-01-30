//
//  AppViewModel.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import Foundation
import Combine

enum NavItem: Hashable {
    case contentIndex
    case contentDetail/*(viewmodel: ContentDetailViewModel)*/
}

class AppViewModel: ObservableObject {
    @Published var navStack: [NavItem] = []
    @Published var navTitle: String = "TabNews"
    
    var loader: AsyncLoader<[ContentIndexItem]> = AsyncLoader {
        let service = ContentService()
        do {
            let dtos = try await service.getIndexPage()
            return dtos.map { dto in
                ContentIndexItem(contentDTO: dto)
            }
        } catch {
            throw error
        }
    }

    func gotoDetail() {
        navStack.append(.contentDetail)
    }
}
