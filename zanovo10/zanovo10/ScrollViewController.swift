//
//  ScrollViewController.swift
//  zanovo10
//
//  Created by qeqwe on 20.11.2023.
//

import UIKit


final class ScrollViewController: UIViewController {
    
    private lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 200)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.bounces = true
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.contentSize = contentViewSize
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.frame.size = contentViewSize
        return containerView
    }()
    
    private lazy var burgerDzoLabel: UILabel = {
        let label = UILabel()
        label.text = "Бургерная Джо"
        label.textColor = .black
        label.font = UIFont(name: "Times New Roman", size: 22)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var americanKichenLabel: UILabel = {
        let label = UILabel()
        label.text = "Американская кухня"
        label.textColor = .black
        label.font = UIFont(name: "Times New Roman", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Что нужно для того, чтобы приготовить самые вкусные бургеры?Сперва, это качественные ингридиенты."
        label.textColor = .black
        label.font = UIFont(name: "Times New Roman", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var saleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша скидка 20%"
        label.textColor = .black
        label.font = UIFont(name: "Times New Roman", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var reitingLabel: UILabel = {
        let label = UILabel()
        label.text = "5.0"
        label.textColor = .black
        label.font = UIFont(name: "Times New Roman", size: 19)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Депозит состовляет 100.При отмене брони менее чем за 2 часа депозит удерживается"
        label.textColor = .black
        label.font = UIFont(name: "Times New Roman", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var burgerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "burger")
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
        
    }()
    
    private lazy var mapImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "karta")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("МЕНЮ", for: .normal)
        button.layer.borderColor = UIColor.green.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .white
        button.setTitleColor(.green, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var bayButton: UIButton = {
        let button = UIButton()
        button.setTitle("ЗАКАЗАТЬ НА ВЫНОС", for: .normal)
        button.layer.borderColor = UIColor.green.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .white
        button.setTitleColor(.green, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("СОЗДАТЬ СОБЫТИЕ", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(containerView)
        [burgerDzoLabel, createButton, bayButton, menuButton, mapImageView, burgerImageView, timeLabel, reitingLabel, saleLabel, questionLabel, americanKichenLabel].forEach{$0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            burgerImageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: -40),
            burgerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 1),
            burgerImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -1),
            burgerImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            burgerDzoLabel.topAnchor.constraint(equalTo: burgerImageView.bottomAnchor, constant: 30),
            burgerDzoLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            americanKichenLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            americanKichenLabel.topAnchor.constraint(equalTo: burgerDzoLabel.bottomAnchor, constant: 10),
            saleLabel.topAnchor.constraint(equalTo: americanKichenLabel.bottomAnchor, constant: 15),
            saleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            reitingLabel.topAnchor.constraint(equalTo: americanKichenLabel.bottomAnchor, constant: 15),
            reitingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: saleLabel.bottomAnchor, constant: 15),
            questionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            menuButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 15),
            menuButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            menuButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            mapImageView.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 15),
            mapImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: mapImageView.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            createButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            createButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            createButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            bayButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 15),
            bayButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            bayButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
        ])
    }
}
