//
//  StructSourse.swift
//  zanovo10
//
//  Created by qeqwe on 20.11.2023.
//

struct Source {

    static func allPhotos() -> [Photo] {
        [
            .init(id: 1, imageName: "Unknown1", nameLabel: "Lux", saleLabel: "30%", priceLabel: "500$"),
            .init(id: 2, imageName: "Unknown2", nameLabel: "Swag", saleLabel: "50%", priceLabel: "550$"),
            .init(id: 3, imageName: "Unknown3", nameLabel: "Luxury", saleLabel: "10%", priceLabel: "500$"),
            .init(id: 4, imageName: "images1", nameLabel: "Model", saleLabel: "10%", priceLabel: "400$"),
            .init(id: 5, imageName: "images2", nameLabel: "Tiptop", saleLabel: "30%", priceLabel: "7770$"),
            .init(id: 6, imageName: "images3", nameLabel: "Skvirt", saleLabel: "50%", priceLabel: "1111110$"),
        ]
    }
}

struct Photo {
    let id: Int
    let imageName: String
    let nameLabel: String
    let saleLabel: String
    let priceLabel: String
}
