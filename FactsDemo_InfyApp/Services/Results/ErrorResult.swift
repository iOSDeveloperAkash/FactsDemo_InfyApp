//
//  ErrorResult.swift
//  FactsDemoApp
//
//  Created by Akash on 11/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
