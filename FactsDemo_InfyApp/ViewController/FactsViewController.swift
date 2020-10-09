//
//  ViewController.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 09/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    let factsTableView = UITableView()
//    var dataSource: FactsDataSource?
    private let refreshControl = UIRefreshControl()
//    private var viewModel: FactsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        intialSetUp()
    }
    
    func intialSetUp() {
         view.backgroundColor = .orange
//         self.setTableView()
//         self.registerCells()
//         self.viewModel?.fetchServiceCall()
     }


}

