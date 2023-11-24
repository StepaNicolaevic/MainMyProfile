//
//  ViewController.swift
//  trenirovkf
//
//  Created by qeqwe on 22.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 350, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private let netWorkManager = NetWorkManager()
    private var dataSourse: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        collectionView.backgroundColor = UIColor(red: 0.184, green: 0.184, blue: 0.184, alpha: 1.00)
        
    }
    private func setupUI() {
        collectionView.delegate = self
        
        netWorkManager.obtainСartoonСharacters { [weak self] (result) in
            guard let self = self else { return }
            self.dataSourse = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.register(CharacterCollectionViewSell.self, forCellWithReuseIdentifier: "\(CharacterCollectionViewSell.self)")
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterCollectionViewSell.self)", for: indexPath) as? CharacterCollectionViewSell else {
            return UICollectionViewCell()
        }
        cell.setup(model: dataSourse[indexPath.row])
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var id = dataSourse[indexPath.item].id
        netWorkManager.fullInfoCharacter(id: id ?? 1) { [weak self] (result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let vc = CharacterViewController(dataSourse: result)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

