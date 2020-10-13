//
//  UITableViewExtension.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 10/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//
import UIKit
extension UITableView{
    func registerCell<T:UITableViewCell>(_:T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T:UITableViewCell>(for indexPath:IndexPath)->T{
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error while dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

