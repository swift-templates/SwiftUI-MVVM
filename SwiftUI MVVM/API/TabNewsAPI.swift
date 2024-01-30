//
//  TabNewsAPI.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 22/01/24.
//

import Foundation

class TabNewsAPI {
    static var shared = TabNewsAPI()
    
    private let session = URLSession(configuration: .default)

    private var baseHost: String {
        "https://www.tabnews.com.br/api/v1"
    }

    private var baseUrlComponents: URLComponents? {
        URLComponents(string: baseHost)
    }

    private func urlComponents(for endpoint: Endpoint) throws -> URLComponents {
        guard var urlComponents = baseUrlComponents else {
            throw NetworkError.invalidURLError
        }

        urlComponents.appendingToPath(endpoint.path)
        urlComponents.appendQueryItems(endpoint.queryItems)
        return urlComponents
    }
}

extension TabNewsAPI {
    func performRequest(to endpoint: Endpoint) async throws -> Data {
        do {
            let urlComponents = try urlComponents(for: endpoint)
            guard let url = urlComponents.url else {
                throw NetworkError.invalidURLError
            }

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = endpoint.method.rawValue

            let data = try await executeRequest(urlRequest: urlRequest)
            return data
        } catch {
            throw error
        }
    }

    private func executeRequest(urlRequest: URLRequest) async throws -> Data {
        do {
            let (data, response) = try await session.data(for: urlRequest)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.noResponse
            }

//            switch httpResponse.statusCode {
//                
//            }

            return data
        } catch {
            throw error
        }
    }
}
