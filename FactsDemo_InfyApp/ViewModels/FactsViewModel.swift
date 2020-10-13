//
//  FactsViewModel.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 11/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation
class FactsViewModel{
    var rows = [Row?]()
    var title = String()
    
    func fetchFacts(completion: @escaping (Result<Fact, Error>) -> Void) {
        HttpManager.shared.get(urlString: baseUrl+factsExtensionUrl) { [weak self] result in
            switch result{
            case .failure(let error):
                print("failure:\(error)")
                completion(.failure(error))
                
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let facts = try decoder.decode(Fact.self, from: data)
                    guard let rows = facts.rows else { return }
                    self?.rows = rows
                    self?.title = facts.title ?? ""
                    completion(.success(try decoder.decode(Fact.self, from: data)))
                }catch{
                    print(error.localizedDescription)
                    // deal with error from JSON decoding if used in production
                }
            }
        }
    }
}

