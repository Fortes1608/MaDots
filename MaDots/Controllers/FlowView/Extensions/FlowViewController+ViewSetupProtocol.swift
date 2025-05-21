//
//  FlowViewController+ViewSetupProtocol.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit
// MARK: ViewCodeProtocol
extension FlowViewController: ViewSetupProtocol {
    
    func addSubViews() {
        view.addSubview(emptyView)
        view.addSubview(toolBar)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: toolBar.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 78),

            
            
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emptyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 166),
        ])
    }
}


