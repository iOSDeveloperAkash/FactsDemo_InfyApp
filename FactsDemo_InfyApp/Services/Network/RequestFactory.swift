//
//  RequestFactory.swift
//  FactsDemoApp
//
//  Created by Akash on 11/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation

final class RequestFactory {
    enum Method: String {
        case GET, POST, PUT, DELETE, PATCH
    }

    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
