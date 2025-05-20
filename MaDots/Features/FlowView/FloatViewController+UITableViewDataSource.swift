//
//  FloatViewController+UITableViewDataSource.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 16/05/25.
//
import UIKit
extension FlowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if rows.isEmpty {
            emptyView.isHidden = false
            tableView.isHidden = true
            return 0
        }
        emptyView.isHidden = true
        tableView.isHidden = false
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlowCell.reuseIdentifier, for: indexPath) as? FlowCell else {
            return UITableViewCell()
        }
        let flows = rows[indexPath.row]
        cell.config(flows: flows)
        return cell
    }
}
