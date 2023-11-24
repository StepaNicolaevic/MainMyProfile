//
//  CellViewController.swift
//  trenirovkf
//
//  Created by qeqwe on 23.11.2023.
//

import Foundation
import UIKit

final class CharacterCollectionViewSell: UICollectionViewCell {
    
    private let characterImageView = UIImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let locationLabel = UILabel()
    private lazy var greenIndicateView: UIView = {
        let label = UIView()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    private let locationPrevLabel = UILabel()
    
    func setup(model: Hero) {
        self.contentView.addSubview(locationPrevLabel)
        locationPrevLabel.text = "Last knonw location: "
        locationPrevLabel.textColor = .gray
        locationPrevLabel.translatesAutoresizingMaskIntoConstraints = false
        locationPrevLabel.font = UIFont(name: "Times New Roman", size: 14)
        self.contentView.addSubview(greenIndicateView)
        switch model.status {
        case.alive:
            greenIndicateView.backgroundColor = .green
        case.dead:
            greenIndicateView.backgroundColor = .red
        case.unknown:
            greenIndicateView.backgroundColor = .red
        default:
            return
        }
        contentView.backgroundColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1.00)
        locationLabel.numberOfLines = 0
        locationLabel.font = UIFont(name: "Times New Roman", size: 15)
        locationLabel.textColor = .white
        nameLabel.font = UIFont(name: "Times New Roman", size: 20)
        nameLabel.textColor = .white
        self.contentView.addSubview(characterImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(statusLabel)
        self.contentView.addSubview(locationLabel)
        nameLabel.text = model.name
        statusLabel.text = " \(model.status.rawValue) - Human"
        statusLabel.textColor = .white
        locationLabel.text = model.location.name
        guard let imageURL = URL(string: model.image ?? "") else { return }
        characterImageView.load(url: imageURL)
        greenIndicateView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -200),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 7),
            greenIndicateView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 7),
            greenIndicateView.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
            greenIndicateView.widthAnchor.constraint(equalToConstant: 8),
            greenIndicateView.heightAnchor.constraint(equalToConstant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 25),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            locationPrevLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 10),
            locationPrevLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 7),
            locationLabel.topAnchor.constraint(equalTo: locationPrevLabel.bottomAnchor, constant: 3),
            locationLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 7)

        ])
    }
}
