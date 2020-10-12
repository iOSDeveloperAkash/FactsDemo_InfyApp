//
//  FeedsService.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation

class FactsService: RequestHandler, FactsServiceProtocol {
    let endpoint = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    var task: URLSessionTask?
    
    func fetchFacts(_ completion: @escaping ((Result<FactsModel, ErrorResult>) -> Void)) {
        self.cancelFetchFacts()
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchFacts() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
