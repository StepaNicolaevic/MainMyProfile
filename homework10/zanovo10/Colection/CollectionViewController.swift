//
//  CollectionViewController.swift
//  zanovo10
//
//  Created by qeqwe on 20.11.2023.
//

import UIKit

final class CollectionViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 150, height: 230)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.frame = CGRect(x: 0, y: 80, width: 250, height: 30)
        bar.showsCancelButton = true
        bar.placeholder = "Poisk"
        bar.sizeToFit()
        return bar
    }()
    
    private let sourse: [Photo] = Source.allPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.addSubview(searchBar)
        view.backgroundColor = .white
    }
    
    private func setupCollectionView() {
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        collectionView.dataSource = self
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCell.self)", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        cell.priceLabel.text = sourse[indexPath.item].priceLabel
        cell.saleLabel.text = sourse[indexPath.item].saleLabel
        cell.nameLabel.text = sourse[indexPath.item].nameLabel
        cell.imageView.image = UIImage(named: sourse[indexPath.item].imageName)
        return cell
    }
}



