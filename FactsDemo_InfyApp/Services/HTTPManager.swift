//
//  HTTPManager.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 12/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation
class HttpManager{
    static let shared = HttpManager()
    enum HTTPError:Error{
        case invalidUrl
        case invalidResponse(Data?, URLResponse?)
    }
    
    public func get(urlString:String, completionBlock:@escaping(Result<Data,Error>)->Void){
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(HTTPError.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }
            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                    return
            }
            completionBlock(.success(responseData))
        }
        task.resume()
    }
}
