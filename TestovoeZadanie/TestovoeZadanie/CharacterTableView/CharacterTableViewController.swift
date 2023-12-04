//
//  CharacterTableViewController.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 27.11.2023.
//

import UIKit

final class CharacterTableViewController: UIViewController, UITableViewDelegate, EpisodColllectionDelegate {
    func didTapImagess(with epizodeCharacter: EpisodeAndCharacter) {
    }
    
    private var chracterDetails: [getInfoCharacter] = []
    private var characterInfo: EpisodeAndCharacter
    
    init(characterInfo: EpisodeAndCharacter) {
        self.characterInfo = characterInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView: UITableView = .init(frame: .zero, style: .grouped)
    
    private let characterImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 75
        image.layer.borderWidth = 1
        image.clipsToBounds = true
        return image
        
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Times New Roman", size: 32)
        label.textColor = .black
        return label
    }()
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.textColor = .gray
        label.text = "Information"
        return label
    }()
    
    private lazy var getFotoButton: UIButton = {
        let buttons = UIButton()
        buttons.setImage(UIImage(named: "Camera"), for: .normal)
        buttons.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        return buttons
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        setupUI()
        setupTableView()
        configureData()
    }
    @objc private func showActionSheet() {
        let alertController = UIAlertController(title: "Загрузите изображение", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Камера", style: .default) { (action:UIAlertAction) in
        }
        
        let action2 = UIAlertAction(title: "Галерея", style: .default) { (action:UIAlertAction) in
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (action:UIAlertAction) in }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    
    private let target = UIImageView()
    
    func setupUI() {
       
        target.image = UIImage(named: "logo-black")
        let customImage = UIBarButtonItem(customView: target)
        navigationItem.rightBarButtonItem = customImage
        view.addSubview(getFotoButton)
        tableView.addSubview(informationLabel)
        guard let imageURL = URL(string: characterInfo.characters.image) else { return }
        characterImageView.load(url: imageURL)
        nameLabel.text = characterInfo.characters.name
        view.addSubview(nameLabel)
        view.addSubview(characterImageView)
        getFotoButton.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            characterImageView.widthAnchor.constraint(equalToConstant: 147),
            characterImageView.heightAnchor.constraint(equalToConstant: 148),
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getFotoButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 2),
            getFotoButton.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor),
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 5),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            informationLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 4),
            informationLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor)
            
        ])
    }
    
    private func setupTableView() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24),
            tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 312),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureData() {
        chracterDetails = [getInfoCharacter.init(header: "Gender", characteristic: characterInfo.characters.gender),
                           getInfoCharacter.init(header: "Status", characteristic: characterInfo.characters.status),
                           getInfoCharacter.init(header: "Specie", characteristic: characterInfo.characters.species),
                           getInfoCharacter.init(header: "Origin", characteristic: characterInfo.characters.origin.name),
                           getInfoCharacter.init(header: "Type", characteristic: characterInfo.characters.type),
                           getInfoCharacter.init(header: "Location", characteristic: characterInfo.characters.location.name)]
        
        
        tableView.reloadData()
    }
}

extension CharacterTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chracterDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = chracterDetails[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell
                else { return UITableViewCell() }
        
        cell.configure(settings: model)
        return cell
    }
}
