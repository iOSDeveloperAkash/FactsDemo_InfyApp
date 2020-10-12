//
//  FeedsServiceProtocol.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation

protocol FactsServiceProtocol {
    func fetchFacts(_ completion: @escaping ((Result<FactsModel, ErrorResult>) -> Void))
}
