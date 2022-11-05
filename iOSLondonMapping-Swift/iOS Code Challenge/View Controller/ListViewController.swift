//
//  ListViewController.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import UIKit
import MapKit

class ListViewController: UIViewController {
    private let cellIdentifier = "DefaultCell"
    private let monumentsStore: GetMonumentsProtocol

    init(_ monumentsStore: GetMonumentsProtocol = MonumentsDatabase.sharedInstance) {
        self.monumentsStore = monumentsStore
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var tableView: UITableView?
    var monuments: [Monument]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "List of Monuments"

        self.getMonuments()
    }

    // MARK: Setups
    private func setupTableView() {
        tableView = UITableView()
        if let tableView {
            tableView.frame = view.frame
            tableView.dataSource = self
            tableView.delegate = self
            view.addSubview(tableView)
        }
    }

    private func getMonuments() {
        monumentsStore.loadMonuments { [weak self] result in
            guard let self = self else { return }
            self.monuments = result
            self.tableView?.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource Delegate & UITableViewDelegate Methods
extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.monuments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // We can use defaul cell type
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }

        if let monuments {
            let monument = monuments[indexPath.row]
            cell.textLabel?.text = monument.name
            cell.detailTextLabel?.text = monument.location
        }

        return cell

    }
    
    // Mark: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


