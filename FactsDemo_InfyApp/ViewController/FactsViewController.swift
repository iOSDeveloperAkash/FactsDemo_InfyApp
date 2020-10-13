//
//  FactsViewController.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 09/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    let factsTableView = UITableView()
    var dataSource: FactsDataSource?
    private let refreshControl = UIRefreshControl()
    private var viewModel: FactsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        intialSetUp()
        setupUIRefreshControl()
    }
    
    fileprivate func intialSetUp() {
        view.backgroundColor = .white
        configureTableView()
        configuretableViewCell()
        self.viewModel?.fetchServiceCall()
    }
    
    fileprivate func configureTableView(){
        view.addSubview(factsTableView)
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        factsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        factsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        factsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        factsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        factsTableView.dataSource = dataSource
        factsTableView.tableFooterView = UIView(frame: .zero)
        factsTableView.estimatedRowHeight = 150
        factsTableView.rowHeight = UITableView.automaticDimension
    }
    
    fileprivate func configuretableViewCell(){
        factsTableView.registerCell(FactsTableViewCell.self)
    }
    
    fileprivate func setupUIRefreshControl() {
        refreshControl.addTarget(self, action: #selector(serviceCall), for: UIControl.Event.valueChanged)
        self.factsTableView.addSubview(refreshControl)
    }
    
    @objc func serviceCall() {
        DispatchQueue.main.async {
            self.viewModel?.fetchServiceCall()
        }
        refreshControl.endRefreshing()
    }
}

extension FactsViewController: Configurable {

    typealias T = FactsViewModel

    func bind(to model: T) {
        self.viewModel = model
        self.dataSource = self.viewModel?.dataSource as? FactsDataSource

        self.viewModel?.dataSource?.facts.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.factsTableView.reloadData()
        })

        self.viewModel?.title.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.navigationItem.title = self?.viewModel?.title.value
        })
    }
}

