//
//  URLComponents+appending.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 22/01/24.
//

import Foundation

extension URLComponents {
    mutating func appendingToPath(_ string: String) {
        path += string
    }

    mutating func appendQueryItems(_ newQueryItems: [URLQueryItem]) {
        guard self.queryItems != nil else {
            self.queryItems = newQueryItems
            return
        }

        self.queryItems?.append(contentsOf: newQueryItems)
    }
}
