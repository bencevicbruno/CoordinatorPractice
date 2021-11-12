//
//  HeaderCollectionCell.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit


final class ContentCollectionCell: UICollectionViewCell {
    // MARK: - Properties
    var number: Int! {
        didSet {
            image.image = UIImage(systemName: "\(number ?? 0).square")!
        }
    }
    
    // MARK: - Setup
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 150),
            image.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
    // MARK: - Views
    private lazy var image: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        image.layer.cornerRadius = 10
        
        return image
    }()
}
