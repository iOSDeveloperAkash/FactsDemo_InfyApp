//
//  FeedsServiceTests.swift
//  FactsDemoAppTests
//
//  Created by Akash SINGH on 150/10/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import XCTest
@testable import Facts_App

class FeedsServiceTests: XCTestCase {
    func testCancelRequest() {
        let viewModel: FactsViewModel! = FactsViewModel()
        viewModel.fetchFacts { (result) in
            print(result)
        }
        viewModel.cancelFetchFacts()
        XCTAssertNil(viewModel.task, "Expected task nil")
    }
}
