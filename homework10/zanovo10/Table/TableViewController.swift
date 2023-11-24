//
//  TableViewController.swift
//  zanovo10
//
//  Created by qeqwe on 20.11.2023.
//

import UIKit

final class TableViewController: UIViewController {
    
    private var settings = SourseTable.makeSettingsUnGroups()
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
    }
}

extension TableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        cell.accessoryType = .disclosureIndicator
        
        cell.configure(seting: settings[indexPath.section][indexPath.row])
        
        return cell
    }
}

extension TableViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
