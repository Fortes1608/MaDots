//
//  YearViewController +UITableViewDelegate.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit
extension YearViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        let year = sections[section]
        let isExpanded = expandedSections.contains(section)

        let header = YearHeaderView()
        header.config(year: year, isExpanded: isExpanded, section: section) { [weak self] in
            self?.toggleSection(section)
        }
        return header

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let year = sections[indexPath.section]
        let month = monthsByYear[year]?[indexPath.row]
        
        let flowVC = FlowViewController()
        flowVC.month = month ?? " "
        flowVC.year = year
        navigationController?.pushViewController(flowVC, animated: true)
        
    }

    func toggleSection(_ section: Int) {
        let year = sections[section]

        if expandedSections.contains(section) {
            expandedSections.remove(section)
        } else {
            if monthsByYear[year] == nil {
                monthsByYear[year] = Persistence.monthsWithFlow(year: year)
            }
            expandedSections.insert(section)
        }
        
        tableView.reloadSections([section], with: .automatic)
    }}
