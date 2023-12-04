//
//  FavouritesNavViewController.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 26.11.2023.
//

import UIKit

final class FavouritesNavViewController: UIViewController, EpisodColllectionDelegate {
    func didTapImagess(with epizodeCharacter: EpisodeAndCharacter) {
        let VCdel = CharacterTableViewController(characterInfo: epizodeCharacter)
        navigationController?.pushViewController(VCdel, animated: true)
    }
    
    private var selectedData = DataManager.shared.selectedData
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 311, height: 357)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Favourites episodes"
           label.font = UIFont(name: "Karla-Bold", size: 24)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: "\(EpisodesCollectionViewCell.self)")
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FavouritesNavViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataManager.shared.selectedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(EpisodesCollectionViewCell.self)", for: indexPath) as? EpisodesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.favoriteSetButton.setBackgroundImage(UIImage(named: "VectorRed"), for: .normal)
        cell.setup(model: DataManager.shared.selectedData[indexPath.item], reloadDelegate: self)
        cell.delegate = self
        return cell
        
    }
}

extension FavouritesNavViewController: ReloadCollectionView {
    func reloadCollection() {
        collectionView.reloadData()
    }
}
