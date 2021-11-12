//
//  ViewController.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        helloWorldLabel.layer.backgroundColor = UIColor.green.cgColor
        
        NSLayoutConstraint.activate([
            helloWorldLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            helloWorldLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    private lazy var helloWorldLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, world!"
        label.font = UIFont.systemFont(ofSize: 26)
        self.view.addSubview(label)
        
        return label
    }()

}

