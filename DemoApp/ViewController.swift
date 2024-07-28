//
//  ViewController.swift
//  DemoApp
//
//  Created by Eugene on 25.07.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .singleLine
        table.register(BreedsTableViewCell.self, forCellReuseIdentifier: BreedsTableViewCell.reuseIdentifier)
        return table
    }()
    
    var dataSource: [CatBreeds] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        /// Данные для ячеек
        dataSource = Array(repeating: CatBreeds(name: "Abyssinian",
                                                temperament: "Active, Energetic, Independent, Intelligent, Gentle",
                                                image: UIImage(named: "cat")), count: 5)
        
        /// Добавляем tableView и размечаем его на экране
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    /// Сколько ячеек показыввть
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    /// Откуда берем даные для ячеек и куда их передаем
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedsTableViewCell.reuseIdentifier, for: indexPath) as! BreedsTableViewCell
        let cat = dataSource[indexPath.row]
        cell.configureCell(with: cat)
        return cell
    }
}
