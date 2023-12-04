//
//  CharacterTableViewCell.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 27.11.2023.
//
//
import UIKit

final class CharacterTableViewCell: UITableViewCell {
    
    private let header = UILabel()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        header.font = UIFont.boldSystemFont(ofSize: 15)
        contentView.addSubview(header)
        contentView.addSubview(nameLabel)
        header.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .gray
        
        NSLayoutConstraint.activate([
         
            header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            header.heightAnchor.constraint(equalToConstant: 24),
            nameLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -6),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
        
        ])
    }
    
    func configure(settings model: getInfoCharacter) {
        header.text = model.header
        nameLabel.text = model.characteristic
    }
}
