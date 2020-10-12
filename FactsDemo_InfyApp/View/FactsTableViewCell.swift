//
//  FactsTableViewCell.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 10/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    var factsCellViewModel: FactsCellViewModel?

    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    //Facts imageView
    let factsImageView:UIImageView = {
        let imgage = UIImageView()
        imgage.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imgage.contentMode = .scaleAspectFill // image will definately be strecthed vertially or horizontally
        imgage.layer.cornerRadius = 35
        imgage.layer.masksToBounds = true
        imgage.clipsToBounds = true
        imgage.layer.borderWidth = 2.0
        return imgage
    }()
    
    //Title Label
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Description Label
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.clipsToBounds = true
        contentView.addSubview(factsImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        contentView.addSubview(containerView)
        factsImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        factsImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        factsImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        factsImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor,constant: 10).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.factsImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-50).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -10).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor,constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor,constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.factsImageView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        
    }
}

extension FactsTableViewCell: Configurable {
    typealias T = FactsCellViewModel
    
    func bind(to model: FactsCellViewModel) {
        self.factsCellViewModel = model
        if let fact = self.factsCellViewModel?.fact.value {
            self.populateCell(with: fact)
        }
    }

    func populateCell(with fact: FactModel) {
        self.titleLabel.text = fact.title
        self.descriptionLabel.text = fact.description
        self.factsImageView.image = UIImage(named: "Placeholder")
    }
}
