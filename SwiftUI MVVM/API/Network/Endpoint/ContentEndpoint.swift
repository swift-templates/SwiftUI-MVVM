//
//  ContentEndpoint.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import Foundation
enum ContentEndpoint: Endpoint {
    case getIndexPageContent
    case getContentDetails(ownerName: String, slug: String)
    case getContentChildren(ownerName: String, slug: String)
}

extension ContentEndpoint{
    var path: String {
        switch self {
            case .getIndexPageContent:
                return "/contents"
            case let .getContentChildren(ownerName, slug):
                return "/contents/\(ownerName)/\(slug)/children"
            case let .getContentDetails(ownerName, slug):
                return "/contents/\(ownerName)/\(slug)/"
        }
    }

    var method: Method {
        .get
    }

    var queryItems: [URLQueryItem] {
        []
    }
}
