//
//  ViewController.swift
//  zanovo10
//
//  Created by qeqwe on 20.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var openCollectionButton: UIButton = {
        let buttons = UIButton()
        buttons.setTitle("Collection", for: .normal)
        buttons.frame = CGRect(x: 130, y:150, width: 150, height: 80)
        buttons.backgroundColor = .black
        buttons.addTarget(self, action: #selector(buttonCollectionViewDidTapped), for: .touchUpInside)
        return buttons
    }()
    
    private lazy var openTableButton: UIButton = {
        let buttons = UIButton()
        buttons.setTitle("Table", for: .normal)
        buttons.frame = CGRect(x: 130, y: 300, width: 150, height: 80)
        buttons.backgroundColor = .black
        buttons.addTarget(self, action: #selector(buttonTableViewDidTaped), for: .touchUpInside)
        return buttons
    }()
    
    private lazy var openScrollButton: UIButton = {
        let buttons = UIButton()
        buttons.setTitle("Scroll", for: .normal)
        buttons.frame = CGRect(x: 130, y: 450, width: 150, height: 80)
        buttons.backgroundColor = .black
        buttons.addTarget(self, action: #selector(buttonScrollViewDidTapped), for: .touchUpInside)
        return buttons
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(openCollectionButton)
        view.addSubview(openTableButton)
        view.addSubview(openScrollButton)
    }
    
    @objc private func buttonCollectionViewDidTapped() {
        let collectinVC = CollectionViewController()
        navigationController?.pushViewController(collectinVC, animated: true)
    }
    
    @objc private func buttonTableViewDidTaped() {
        let tableVC = TableViewController()
        navigationController?.pushViewController(tableVC, animated: true)
    }
    
    @objc private func buttonScrollViewDidTapped() {
        let scrollVC = ScrollViewController()
        navigationController?.pushViewController(scrollVC, animated: true)
    }
}

