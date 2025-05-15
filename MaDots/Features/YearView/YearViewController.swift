//
//  YearViewController.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 14/05/25.
//
import UIKit
class YearViewController: UIViewController {
    
    let sections = ["2025","2024", "2023",]
    let monthsByYear: [String: [String]] = [
        "2023": ["June", "July"],
        "2024": ["January", "February", "March"],
        "2025": ["April", "May", "June"]
    ]
    
    var expandedSections: Set<Int> = []
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.tintColor = .background
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Year"
            navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        tableView.backgroundColor = .systemGray6
        addSubViews()
        setupConstraints()
    }
}
