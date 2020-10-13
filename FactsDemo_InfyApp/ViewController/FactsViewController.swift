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
    private let refreshControl = UIRefreshControl()
    var rowData = [Row]()
    private var viewModel = FactsViewModel()

    
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
        viewModel.fetchFacts{ [weak self] breaches in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    func updateUI() {
        factsTableView.reloadData()
    }
    
    fileprivate func configureTableView(){
        view.addSubview(factsTableView)
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        factsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        factsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        factsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        factsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        factsTableView.dataSource = self
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
            //            self.viewModel?.fetchServiceCall()
        }
        refreshControl.endRefreshing()
    }
}

extension FactsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as! FactsTableViewCell
        guard let fact = viewModel.rows[indexPath.row] else {return cell}
        cell.populateCell(with: fact)
        return cell
    }
}

