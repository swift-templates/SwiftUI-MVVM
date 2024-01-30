//
//  Endpoint.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 22/01/24.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: Method { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    func request<T: Decodable>() async throws -> T {
        do {
            let data = try await TabNewsAPI.shared.performRequest(to: self)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedModel: T = try decoder.decode(T.self, from: data)
            return decodedModel
        } catch {
            throw error
        }
    }
}

