//
//  MyProfileViewController.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

final class MyProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            myProfileImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myProfileImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            myProfileImage.widthAnchor.constraint(equalToConstant: 200),
            myProfileImage.heightAnchor.constraint(equalToConstant: 180),
            
            myProfileLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myProfileLabel.topAnchor.constraint(equalTo: myProfileImage.bottomAnchor, constant: 25),
            myProfileLabel.widthAnchor.constraint(equalToConstant: 200),
            myProfileLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private lazy var myProfileImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.fill.questionmark")?.withTintColor(.blue))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(image)
        
        return image
    }()
    
    private lazy var myProfileLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, myProfile!"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = .white
        label.textAlignment = .center
        self.view.addSubview(label)
        label.layer.backgroundColor = UIColor.blue.cgColor
        label.layer.cornerRadius = 10
        
        return label
    }()
}
