//
//  HomeTab.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import UIKit

struct HomeTab {
    let title: String
    let image: UIImage
    var isSelected: Bool
    
    init(_ title: String, _ image: String) {
        self.title = title
        self.image = UIImage(systemName: image) ?? UIImage(systemName: "xmark.octagon")!
        self.isSelected = false
    }
}
