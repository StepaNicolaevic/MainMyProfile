//
//  CharacterViewController.swift
//  trenirovkf
//
//  Created by qeqwe on 23.11.2023.
//

import UIKit

final class CharacterViewController: UIViewController {
    
    private var dataSourse: Hero?
    
    init(dataSourse: Hero? = nil) {
        self.dataSourse = dataSourse
        super.init(nibName: nil, bundle: nil)
        
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = dataSourse?.name
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 35)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var headingStatusLabel = UILabel()
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = dataSourse?.status.rawValue
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 21)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var headingSpeciecAndGennderLabel = UILabel()
    private lazy var speciecAndGennderLabel: UILabel = {
        let label = UILabel()
        label.text = "\(dataSourse?.gender?.rawValue ?? ""), \(dataSourse?.species.rawValue ?? "")"
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 21)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var headingLocationLabel = UILabel()
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = dataSourse?.location.name
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 21)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var headingFirstSeenLabel = UILabel()
    private lazy var firstSeenLabel: UILabel = {
        let label = UILabel()
        label.text = dataSourse?.episode?.first
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 21)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var headingEpisodesLabel = UILabel()
    private lazy var episodesLabel: UILabel = {
        let label = UILabel()
        label.text = dataSourse?.episode?.first
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 21)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    private var characterImageView = UIImageView()
    
    private lazy var greenIndicateView: UIView = {
        let label = UIView()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        view.backgroundColor = UIColor(red: 0.18, green: 0.17, blue: 0.15, alpha: 1.00)
    }
    private func setupUI() {
        view.addSubview(greenIndicateView)
        switch dataSourse?.status {
        case.alive:
            greenIndicateView.backgroundColor = .green
        case.dead:
            greenIndicateView.backgroundColor = .red
        case.unknown:
            greenIndicateView.backgroundColor = .red
        default:
            return
        }
        greenIndicateView.translatesAutoresizingMaskIntoConstraints = false
        guard let imageURL = URL(string: dataSourse?.image ?? "") else { return }
        characterImageView.load(url: imageURL)
        view.backgroundColor = .black
        view.addSubview(headingStatusLabel)
        headingStatusLabel.textColor = .gray
        headingStatusLabel.text = "Live status:"
        view.addSubview(headingEpisodesLabel)
        headingEpisodesLabel.textColor = .white
        headingEpisodesLabel.text = "Episodes:"
        headingEpisodesLabel.font = UIFont(name: "Times New Roman", size: 25)
        view.addSubview(headingLocationLabel)
        headingLocationLabel.textColor = .gray
        headingLocationLabel.text = "Last know location:"
        view.addSubview(headingFirstSeenLabel)
        headingFirstSeenLabel.textColor = .gray
        headingFirstSeenLabel.text = "First seen in:"
        view.addSubview(headingSpeciecAndGennderLabel)
        headingSpeciecAndGennderLabel.textColor = .gray
        headingSpeciecAndGennderLabel.text = "Species and gender:"
        view.addSubview(episodesLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(characterImageView)
        view.addSubview(firstSeenLabel)
        view.addSubview(statusLabel)
        view.addSubview(speciecAndGennderLabel)
        characterImageView.contentMode = .scaleToFill
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        speciecAndGennderLabel.translatesAutoresizingMaskIntoConstraints = false
        firstSeenLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        headingStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        headingEpisodesLabel.translatesAutoresizingMaskIntoConstraints = false
        headingLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        headingFirstSeenLabel.translatesAutoresizingMaskIntoConstraints = false
        headingSpeciecAndGennderLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
    }
        private func setupConstraint() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 150),
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headingStatusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            headingStatusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            greenIndicateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            greenIndicateView.topAnchor.constraint(equalTo: headingStatusLabel.bottomAnchor, constant: 12),
            greenIndicateView.widthAnchor.constraint(equalToConstant: 8),
            greenIndicateView.heightAnchor.constraint(equalToConstant: 8),
            statusLabel.topAnchor.constraint(equalTo: headingStatusLabel.bottomAnchor, constant: 5),
            statusLabel.leadingAnchor.constraint(equalTo: greenIndicateView.trailingAnchor, constant: 10),
            headingSpeciecAndGennderLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 15),
            headingSpeciecAndGennderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            speciecAndGennderLabel.topAnchor.constraint(equalTo: headingSpeciecAndGennderLabel.bottomAnchor, constant: 5),
            speciecAndGennderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headingLocationLabel.topAnchor.constraint(equalTo: speciecAndGennderLabel.bottomAnchor, constant: 15),
            headingLocationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            locationLabel.topAnchor.constraint(equalTo: headingLocationLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headingFirstSeenLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15),
            headingFirstSeenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            firstSeenLabel.topAnchor.constraint(equalTo: headingFirstSeenLabel.bottomAnchor, constant: 5),
            firstSeenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headingEpisodesLabel.topAnchor.constraint(equalTo: firstSeenLabel.bottomAnchor, constant: 15),
            headingEpisodesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            episodesLabel.topAnchor.constraint(equalTo: headingEpisodesLabel.bottomAnchor, constant: 5),
            episodesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
}





