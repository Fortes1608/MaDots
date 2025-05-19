//
//  FloatViewController+UITableViewDataSource.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 16/05/25.
//
import UIKit
extension FlowViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
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
