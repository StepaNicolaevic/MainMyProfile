//
//  LaunchViewController.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 26.11.2023.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    private lazy var loadingImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Loading component")
        return image
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadScrin()
    }
    
    private func setupLoadScrin() {
        
        animatedImage()
        view.backgroundColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.animatedImage()
        })
        view.addSubview(logoImageView)
        view.addSubview(loadingImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        loadingImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingImageView.widthAnchor.constraint(equalToConstant: 200),
            loadingImageView.heightAnchor.constraint(equalToConstant: 200),
            loadingImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 347),
            loadingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 312),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func animatedImage() {
        let rotationImageAnimation = CABasicAnimation(keyPath: "roatingAnimation")
        rotationImageAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationImageAnimation.duration = 3
        rotationImageAnimation.repeatCount = .infinity
        loadingImageView.layer.add(rotationImageAnimation, forKey: "roatingAnimation")
        UIView.animate(withDuration: 3, animations: {
            self.loadingImageView.alpha = 3
        }, completion: { done in
            if done {
                let viewController = ViewController()
                viewController.modalTransitionStyle = .crossDissolve
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true)
            }
        })
    }
}
