//
//  UIViewController+Extension.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 14/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import UIKit
extension UIViewController {
    func alert(message: String, alertTitle:String) {
        let alertController = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        if let presented = self.presentedViewController {
            presented.removeFromParent()
        }
        
        if presentedViewController == nil {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
