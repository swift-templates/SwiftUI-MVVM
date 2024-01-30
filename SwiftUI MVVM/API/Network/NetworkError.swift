//
//  NetworkError.swift
//  SwiftUI MVVM
//
//  Created by Joao Leonardo Pereira on 22/01/24.
//

import Foundation

public enum NetworkError: Error {
    /// Indicates if the URL used is invalid and cannot be properly constructed
    case invalidURLError

    /// Indicates that there was no valid response from the request
    case noResponse
}
