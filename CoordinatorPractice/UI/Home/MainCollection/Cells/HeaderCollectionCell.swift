//
//  HeaderCollectionCell.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

struct HeaderCellData {
    let image: UIImage
    let title: String
}

final class HeaderCollectionCell: UICollectionViewCell {
    var data: HeaderCellData!
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 40),
//            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private lazy var image: UIImageView = {
        let image = UIImageView(image: data.image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
//        image.layer.backgroundColor = UIColor.red.cgColor
        image.layer.cornerRadius = 10
        
        return image
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = data.title
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = UIColor.red
        label.textAlignment = .center
        self.addSubview(label)
        
        return label
    }()
}
