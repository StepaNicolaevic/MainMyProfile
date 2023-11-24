//
//  UIIMageView+extension.swift
//  trenirovkf
//
//  Created by qeqwe on 23.11.2023.
//


import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
                    
                    
                
