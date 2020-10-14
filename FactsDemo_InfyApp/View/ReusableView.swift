//
//  ReusableView.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 10/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import UIKit
protocol ReusableView : class {}
extension ReusableView where Self:UIView{
    static var reuseIdentifier: String{
        return String(describing: self)
    }
}

extension UITableViewCell:ReusableView{}
