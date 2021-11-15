//
//  MoviesViewController.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import UIKit

final class MoviesViewController: UIViewController {
    // MARK: - Properties
    var viewModel: MoviesViewModel!
    
    let textFieldHint = "Search movies..."
    let textFieldFocusedColor = UIColor.black
    let textFieldUnfocusedColor = UIColor.black.withAlphaComponent(0.5)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCallbacks()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            searchField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            searchField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            searchField.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.topAnchor.constraint(equalTo: searchField.topAnchor, constant: 2.5),
            searchButton.leadingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 2.5),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            showList.topAnchor.constraint(equalTo: searchField.bottomAnchor),
            showList.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            showList.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            showList.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)

        ])
    }
    
    private func setupCallbacks() {
        viewModel.showError = { [weak self] error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
    
    // MARK: - UI
    private lazy var searchField: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = self.textFieldHint
        textView.delegate = self
        self.view.addSubview(textView)
        textView.layer.backgroundColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 20

        return textView
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass")!, for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        self.view.addSubview(button)
        
        return button
    }()
    
    private lazy var showList: UITableView = {
       let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "MoviesTableViewCell")
        self.view.addSubview(tableView)
        
        return tableView
    }()
    
    // MARK: - Interactions
    @objc func searchButtonTapped() {
        self.viewModel.searchButtonTapped(searchKey: self.searchField.text) { [weak self] in
            self?.showList.reloadData()
        }
    }
}

extension MoviesViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == self.textFieldHint {
            textView.text = ""
            textView.textColor = self.textFieldFocusedColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = self.textFieldHint
            textView.textColor = self.textFieldUnfocusedColor
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell// ?? MoviesTableViewCell()
        
        cell.show = self.viewModel.shows[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
