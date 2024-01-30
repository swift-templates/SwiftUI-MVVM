//
//  ContentService.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 23/01/24.
//

import Foundation

protocol ContentAPI {
    func getIndexPage() async throws -> [ContentDTO]
    func getContentDetails(ownerName: String, slug: String) async throws -> ContentDTO
    func getContentChildren(ownerName: String, slug: String) async throws -> [ContentDTO]
}

class ContentService: ContentAPI {
    func getIndexPage() async throws -> [ContentDTO] {
        let endpoint: ContentEndpoint = .getIndexPageContent
        return try await endpoint.request()
    }

    func getContentDetails(ownerName: String, slug: String) async throws -> ContentDTO {
        let endpoint: ContentEndpoint = .getContentDetails(ownerName: ownerName, slug: slug)
        return try await endpoint.request()
    }
    
    func getContentChildren(ownerName: String, slug: String) async throws -> [ContentDTO] {
        let endpoint: ContentEndpoint = .getContentChildren(ownerName: ownerName, slug: slug)
        return try await endpoint.request()
    }
}
