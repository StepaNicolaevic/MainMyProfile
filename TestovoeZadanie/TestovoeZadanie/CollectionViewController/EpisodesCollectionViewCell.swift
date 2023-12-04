//
//  EpisodesCollectionViewCell.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 26.11.2023.
//

import UIKit

protocol EpisodColllectionDelegate: AnyObject {
    func didTapImagess(with epizodeCharacter: EpisodeAndCharacter)
}

final class EpisodesCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: EpisodColllectionDelegate?
    weak var reloadDelegate: ReloadCollectionView?
    private var model: EpisodeAndCharacter?
    private var characterDelegate: EpisodeAndCharacter?
    private var epizodeDel: EpisodeAndCharacter?
    private let characterImageView = UIImageView()
    private let nameLabel = UILabel()
    private let numberEpisodLabel = UILabel()
    private let nameEpisodeLabel = UILabel()
    private let playImageView = UIImageView()
    lazy var favoriteSetButton: UIButton = {
        let buttons = UIButton()
        let imagess = UIImage(named: "Vector")
        buttons.setBackgroundImage(UIImage(named: "Vector"), for: .normal)
        buttons.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return buttons
    }()
    
    @objc private func buttonTap(sender: UIButton) {
        
        guard let model = model else { return }
        DataManager.shared.append(model: model)
        reloadDelegate?.reloadCollection()
    }
    
    private let grayView = UIView()
    
    func setup(model: EpisodeAndCharacter, reloadDelegate: ReloadCollectionView?) {
        self.reloadDelegate = reloadDelegate
        self.model = model
        playImageView.image = UIImage(named: "MonitorPlay")
        grayView.addSubview(playImageView)
        grayView.addSubview(favoriteSetButton)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(characterImageView)
        self.contentView.addSubview(grayView)
        self.contentView.addSubview(nameEpisodeLabel)
        self.characterDelegate = model
        favoriteSetButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        playImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        grayView.translatesAutoresizingMaskIntoConstraints = false
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        characterImageView.addGestureRecognizer(tapGestureRecognizer)
        nameLabel.text = model.characters.name
        nameLabel.font = UIFont(name: "Roboto", size: 20)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        guard let imageURL = URL(string: model.characters.image) else { return }
        characterImageView.load(url: imageURL)
        nameEpisodeLabel.font = UIFont(name: "Roboto", size: 16)
        nameEpisodeLabel.text = "\(model.episode) | \(model.name)"
        grayView.backgroundColor = .systemGray6
        setupConstraint()
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            nameEpisodeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
            nameEpisodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            grayView.heightAnchor.constraint(equalToConstant: 71),
            grayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            grayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            grayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 232),
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            playImageView.bottomAnchor.constraint(equalTo: grayView.bottomAnchor, constant: -10),
            playImageView.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 20),
            favoriteSetButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            favoriteSetButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let character = characterDelegate else { return }
        delegate?.didTapImagess(with: character)
    }
}

