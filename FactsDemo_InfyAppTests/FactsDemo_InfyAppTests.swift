//
//  FactsDemo_InfyAppTests.swift
//  FactsDemo_InfyAppTests
//
//  Created by Akash on 09/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import XCTest
@testable import Facts_App

class FactsDemo_InfyAppTests: XCTestCase {
    var window: UIWindow!
    var viewControllerUnderTest: FactsViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    override func setUp() {
        super.setUp()
//        let factsVC = FactsViewController()
//        factsVC.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainController = FactsViewController() as UIViewController
        let navigationController = UINavigationController(rootViewController: mainController)
        window.rootViewController = navigationController
        mainController.viewDidLoad()
        window.makeKeyAndVisible()
    }
    
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.factsTableView)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.factsTableView.dataSource)
    }
    
}
