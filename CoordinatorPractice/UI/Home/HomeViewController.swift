//
//  ViewController.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    private var startingDraggingOffset = CGPoint.zero
    private var currentPage = 0 {
        didSet {
            for index in self.headerCollection.indexPathsForVisibleItems {
                (headerCollection.cellForItem(at: index)! as? HeaderCollectionCell)?.setSelected(index.item == currentPage)
            }
            contentCollection.scrollToItem(at: IndexPath(item: self.currentPage, section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
    
    let tabs = [
        HeaderCellData(image: UIImage(systemName: "pencil")!, title: "Messages"),
        HeaderCellData(image: UIImage(systemName: "folder")!, title: "Archive"),
        HeaderCellData(image: UIImage(systemName: "trash")!, title: "Trash"),
        HeaderCellData(image: UIImage(systemName: "signature")!, title: "Signatures")
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup
    private func setupView() {
        self.view.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            headerCollection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerCollection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            headerCollection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            headerCollection.heightAnchor.constraint(equalToConstant: 60),
            
            contentCollection.topAnchor.constraint(equalTo: headerCollection.bottomAnchor),
            contentCollection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            contentCollection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            contentCollection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    // MARK: - Views
    private lazy var headerCollection: UICollectionView = {
        let collectionView = UICollectionView.getPresetCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HeaderCollectionCell.self, forCellWithReuseIdentifier: "HeaderCollectionCell")
        self.view.addSubview(collectionView)
        
        return collectionView
    }()
    
    private lazy var contentCollection: UICollectionView = {
        let collectionView = UICollectionView.getPresetCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentCollectionCell.self, forCellWithReuseIdentifier: "ContentCollectionCell")
        self.view.addSubview(collectionView)
        
        return collectionView
    }()
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.tabs.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionCell", for: indexPath) as? ContentCollectionCell ?? ContentCollectionCell()
            
            cell.number = indexPath.item
            cell.setupConstraints()
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionCell", for: indexPath) as? HeaderCollectionCell ?? HeaderCollectionCell()
            
            cell.data = tabs[indexPath.item]
            cell.setSelected(indexPath.item == 0)
            cell.setupConstraints()
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == headerCollection {
            return CGSize(width: collectionView.frame.width / CGFloat(self.tabs.count), height: 60)
        } else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView != headerCollection { return }
        
        self.currentPage = indexPath.item
    }
}


// MARK: - Snap to page
extension HomeViewController {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.startingDraggingOffset = scrollView.contentOffset
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView != contentCollection { return }
        
        let cellWidth = collectionView(self.contentCollection, layout: self.contentCollection.collectionViewLayout, sizeForItemAt: IndexPath(item: 0, section: 0)).width
        
        let page: CGFloat
        let proposedPage = scrollView.contentOffset.x / cellWidth
        let delta: CGFloat = scrollView.contentOffset.x > startingDraggingOffset.x ? 0.9 : 0.1
        
        if floor(proposedPage + delta) == floor(proposedPage)
            && scrollView.contentOffset.x <= targetContentOffset.pointee.x {
            page = floor(proposedPage)
        } else {
            page = floor(proposedPage + 1)
        }
        
        targetContentOffset.pointee = CGPoint(x: cellWidth * page, y: targetContentOffset.pointee.y)
        
        self.currentPage = Int(page) > (tabs.count - 1) ? (tabs.count - 1) : Int(page)
    }
}
