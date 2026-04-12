//
//  YearViewController+UITableViewDataSource.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit
extension YearViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let year = sections[section]
        if expandedSections.contains(section) {
            return monthsByYear[year]?.count ?? 0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let year = sections[indexPath.section]
        let month = monthsByYear[year]?[indexPath.row] ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = month
        cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        cell.textLabel?.textColor = .labelPrimary
        cell.backgroundColor = .backgroundGray6
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = .secondaryLabel
        return cell
    }
}
