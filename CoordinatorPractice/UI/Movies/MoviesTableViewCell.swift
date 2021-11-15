//
//  MoviesTableViewCell.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import UIKit

final class MoviesTableViewCell: UITableViewCell {
    // MARK: - PROPERTIES
    var show: TVMazeShow! {
        didSet {
            idLabel.text = "\(show.id)"
            nameRatingLabel.text = "\(show.name) (\(show.averageRating))"
            genresLabel.text = show.genres.joined(separator: ", ")
        }
    }
    
    // MARK: INITIALIZATION
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            idLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            nameRatingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            nameRatingLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 2),
//            nameRatingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            genresLabel.topAnchor.constraint(equalTo: self.nameRatingLabel.bottomAnchor, constant: 2),
            genresLabel.leadingAnchor.constraint(equalTo: self.nameRatingLabel.leadingAnchor)
            
        ])
    }
    
    // MARK: - VIEWS
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        self.addSubview(label)
        
        return label
    }()
    
    private lazy var nameRatingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        self.addSubview(label)
        
        return label
    }()
    
    private lazy var genresLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 10)
        self.addSubview(label)
        
        return label
    }()
}
