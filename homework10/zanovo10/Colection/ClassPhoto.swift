//
//  ClassPhoto.swift
//  zanovo10
//
//  Created by qeqwe on 20.11.2023.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let saleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {//razdeliti na 2 chasti
        saleLabel.backgroundColor = .red
        saleLabel.font = UIFont(name: "Times New Roman", size: 12)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(saleLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        saleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            saleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            saleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            saleLabel.widthAnchor.constraint(equalToConstant: 25),
            saleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
