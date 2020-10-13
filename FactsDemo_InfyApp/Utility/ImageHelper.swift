//
//  ImageHelper.swift
//  FactsDemoApp
//
//  Created by Akash on 09/13/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation
import UIKit

protocol ImageHelperProtocol {
    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath)
}

class ImageHelper: ImageHelperProtocol {
    fileprivate let kLazyLoadPlaceholderImage = UIImage(named: "Placeholder")!
    var imageManager: ImageManager { return ImageManager() }

    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath) {
        let imageView = (cell as? FactsTableViewCell)?.factsImageView
        imageView?.image = kLazyLoadPlaceholderImage
        imageManager.downloadImageFromURL(imageURL) { (success, image) -> Void in
            if success && image != nil {
                if (tableView.indexPath(for: cell) as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
                    imageView?.image = image
                }
            }
        }
    }
}
