//
//  FactsViewModel.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 11/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation
import UIKit

class FactsViewModel{
    var rows = [Row?]()
    var title = String()
    
    /// API Call function to fetch facts.
    /// - Parameter completion: Returns data if sucess else gives error.
    func fetchFacts(completion: @escaping (Result<Fact, Error>) -> Void) {
        HttpManager.shared.get(urlString: baseUrl+factsExtensionUrl) { [weak self] result in
            switch result{
            case .failure(let error):
                print("failure:\(error)")
                self?.rows = []
                completion(.failure(error))
                
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let facts = try decoder.decode(Fact.self, from: data)
                    guard let rows = facts.rows else { return }
                    let filteredFacts = rows.filter({ $0.title != nil || $0.descriptionField != nil || $0.imageHref != nil })
                    self?.rows = filteredFacts
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
