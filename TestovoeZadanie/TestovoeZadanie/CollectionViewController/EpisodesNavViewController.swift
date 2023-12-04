//
//  EpisodesNavViewController.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 26.11.2023.
//

import UIKit

protocol ReloadCollectionView: AnyObject{
    func reloadCollection()
}

final class EpisodesNavViewController: UIViewController, EpisodColllectionDelegate {
    
    func didTapImagess(with epizodeCharacter: EpisodeAndCharacter) {
        let VCdel = CharacterTableViewController(characterInfo: epizodeCharacter)
        navigationController?.pushViewController(VCdel, animated: true)
    }
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        return image
    }()
    
    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Name or episode (ex.S01E01)..."
        bar.layer.borderWidth = 1
        bar.layer.borderColor = UIColor.gray.cgColor
        bar.layer.cornerRadius = 5
        bar.backgroundColor = .white
        bar.searchTextField.backgroundColor = .white
        bar.showsCancelButton = false
        return bar
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 311, height: 357)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var advansetFilteresButton: UIButton = {
          let buttons = UIButton()
          buttons.setTitle("ADVANCED FILTERS", for: .normal)
        buttons.backgroundColor = UIColor(red: 0.80, green: 0.82, blue: 1, alpha: 1)

          return buttons
      }()
    
    private let netWorkManager = NetWorkManager()
    private var mainCharacter: Hero?
   
    private var episodeAndCharacter: [EpisodeAndCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }
    
    private func setupUI() {
        
        collectionView.reloadData()
        navigationItem.backButtonTitle = "GO BACK"
        navigationController?.navigationBar.tintColor = .black
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(collectionView)
        view.addSubview(searchBar)
        view.addSubview(advansetFilteresButton)
        advansetFilteresButton.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        
        netWorkManager.informationOfEpisode { [weak self] (result) in
            guard let self = self else { return }
            for episode in result {
                netWorkManager.fullInfoCharacter(url: episode.characters.randomElement() ?? "") { (character) in
                    self.episodeAndCharacter.append(EpisodeAndCharacter(id: episode.id, name: episode.name, episode: episode.episode, characters: character, url: episode.url, created: episode.created))
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                        
                    }
                }
            }
        }
        collectionView.dataSource = self
        collectionView.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: "\(EpisodesCollectionViewCell.self)")
    }
        func setupConstraint() {

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 312),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            searchBar.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 56),
            advansetFilteresButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            advansetFilteresButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            advansetFilteresButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            advansetFilteresButton.heightAnchor.constraint(equalToConstant: 56),
            collectionView.topAnchor.constraint(equalTo: advansetFilteresButton.bottomAnchor,constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
    @objc private func buttonTapped(sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: self.collectionView)
        
        if let indexPath = self.collectionView.indexPathForItem(at: point) {
            
            if let cell = self.collectionView.cellForItem(at: indexPath) as? EpisodesCollectionViewCell {
                
                let newImage = UIImage(named: "VectorRed")
                let defaultImage = UIImage(named: "Vector")
                
                UIView.animate(withDuration: 0.3, animations: {
                    if sender.currentImage == defaultImage {
                        cell.favoriteSetButton.alpha = 0.0 
                    } else {
                        cell.favoriteSetButton.alpha = 1.0
                    }
                }) { (_) in
                    if sender.currentImage == defaultImage {
                        cell.favoriteSetButton.setBackgroundImage(newImage, for: .normal)
                    } else {
                        cell.favoriteSetButton.setBackgroundImage(defaultImage, for: .normal)
                    }
                    
                    UIView.animate(withDuration: 0.3) {
                        cell.favoriteSetButton.alpha = 1.0
                    }
                }
            }
        }
    }

}
extension EpisodesNavViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodeAndCharacter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(EpisodesCollectionViewCell.self)", for: indexPath) as? EpisodesCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.favoriteSetButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        cell.delegate = self
        cell.setup(model: episodeAndCharacter[indexPath.item], reloadDelegate: nil)
        return cell
        
    }
}

