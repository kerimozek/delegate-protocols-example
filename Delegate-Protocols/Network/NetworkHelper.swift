//
//  NetworkHelper.swift
//  Delegate-Protocols
//
//  Created by Mehmet Kerim ÖZEK on 16.12.2022.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case generalError = "An Error Happened"
}

enum APIURLs {
    static func posts() -> String {
        "https://jsonplaceholder.typicode.com/posts"
    }
    
}
