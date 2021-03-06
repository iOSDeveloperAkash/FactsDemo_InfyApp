//
//  FactViewControllerTest.swift
//  FactsDemo_InfyAppTests
//
//  Created by Akash on 17/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import XCTest
@testable import Facts_App

class FactViewControllerTest: XCTestCase {
    var factViewControler: FactsViewController!
    var factTableViewCell: FactsTableViewCell!
    var viewModel: FactsViewModel!
    
    override func setUpWithError() throws {
        factViewControler = FactsViewController()
        viewModel = FactsViewModel()
        factViewControler.loadView()
        factViewControler.viewDidLoad()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func tearDown() {
        factViewControler = nil
        viewModel = nil
    }
    
    func testControllerHasRefereshControl(){
        XCTAssertNotNil(factViewControler.refreshControl)
    }
    
    func testTableViewHasDatasource() {
        XCTAssertNotNil(factViewControler.factsTableView.dataSource)
    }
    
    func testTableViewHasRowHeight(){
        XCTAssertEqual(factViewControler.factsTableView.estimatedRowHeight, 150)
    }
    
    func testHasValidApiResponse() {
        let expectation = XCTestExpectation.init(description: "CheckResponse")
        viewModel.fetchFacts { (apiResponse) in
            expectation.fulfill()
            switch apiResponse {
            case .success(let data):
                XCTAssertNotNil( data.rows?.count)
            case .failure(let error):
                XCTAssertNotNil( error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func testHasTableViewRows() {
        factViewControler.serviceCall()
        sleep(3)
        XCTAssertNotNil(factViewControler.factsTableView.numberOfRows(inSection: 0))
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(factViewControler.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(factViewControler.responds(to: #selector(factViewControler.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(factViewControler.responds(to: #selector(factViewControler.tableView(_:cellForRowAt:))))
    }
}
