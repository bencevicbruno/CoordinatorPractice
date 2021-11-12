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
        self.view.backgroundColor = .darkGray
        
        helloWorldLabel.layer.backgroundColor = UIColor.red.cgColor
        
        NSLayoutConstraint.activate([
            helloWorldLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            helloWorldLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    private lazy var helloWorldLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, myProfile!"
        label.font = UIFont.systemFont(ofSize: 26)
        self.view.addSubview(label)
        
        return label
    }()
}
