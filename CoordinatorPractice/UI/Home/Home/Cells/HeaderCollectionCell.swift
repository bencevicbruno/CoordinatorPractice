//
//  HeaderCollectionCell.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

final class HeaderCollectionCell: UICollectionViewCell {
    var data: HomeTab!
    
    // MARK: - Setup
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 40),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    // MARK: - Updating
    func setSelected(_ selected: Bool) {
        if selected {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.1)
            self.title.font = UIFont.boldSystemFont(ofSize: 15)
        } else {
            self.backgroundColor = UIColor.white
            self.title.font = UIFont.systemFont(ofSize: 15)
        }
    }
    
    // MARK: - Views
    private lazy var image: UIImageView = {
        let image = UIImageView(image: data.image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        image.layer.cornerRadius = 10
        
        return image
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = data.title
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        self.addSubview(label)
        
        return label
    }()
}
