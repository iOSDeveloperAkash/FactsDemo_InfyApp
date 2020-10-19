//
//  FactsViewController.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 09/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    /// Properties
    let factsTableView = UITableView()
    private let refreshControl = UIRefreshControl()
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
        if Utility.isInternetReachable() {
            viewModel.fetchFacts{ [weak self] _ in
                DispatchQueue.main.async {
                    self?.title = self?.viewModel.title
                    self?.updateUI()
                }
            }
        }else{
            self.alert(message: Message.NoInternetConnection.Localized, alertTitle: Message.Error.Localized)
        }
        
    }
    
    
    func updateUI() {
        factsTableView.reloadData()
    }
    
     func configureTableView(){
        view.addSubview(factsTableView)
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        factsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        factsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        factsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        factsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        factsTableView.dataSource = self
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
    
    /// <#Description#>
    @objc func serviceCall() {
        if Utility.isInternetReachable() {
            self.viewModel.fetchFacts{ [weak self] _ in
                DispatchQueue.main.async {
                    self?.title = self?.viewModel.title
                    self?.updateUI()
                }
            }
            refreshControl.endRefreshing()
        }else{
            factsTableView.setContentOffset(.zero, animated: true)
            refreshControl.endRefreshing()
            self.alert(message: Message.NoInternetConnection.Localized, alertTitle: Message.Error.Localized)
        }
    }
}

extension FactsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FactsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        guard let fact = viewModel.rows[indexPath.row] else {return cell}
        if let fact = viewModel.rows[indexPath.row]{
            cell.populateCell(with: fact)
            guard let imageUrl = fact.imageHref else {
                return cell
            }
            ImageHelper().updateImageForTableViewCell(cell, inTableView: tableView, imageURL: imageUrl, atIndexPath: indexPath)
        }
        cell.populateCell(with: fact)
        return cell
    }
}

