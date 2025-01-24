//
//  HomeViewController.swift
//  EpicStream
//
//  Created by Chris Min on 24/01/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(homeTableView)
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeTableView.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
