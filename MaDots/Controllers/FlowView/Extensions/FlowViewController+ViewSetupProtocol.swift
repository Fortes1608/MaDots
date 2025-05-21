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
            tableView.bottomAnchor.constraint(equalTo: toolBar.topAnchor, constant: -1),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emptyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 166),
            
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 78),
        ])
    }
    func setupAdditionalConfiguration() {
        title = month
        
        view.backgroundColor = .background

        tableView.backgroundColor = .background
        
        navigationItem.leftBarButtonItem = yearFlowButtonItem
        navigationItem.rightBarButtonItems = [monthlyViewButtonItem, detailsFlowButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = true
        detailsFlowButtonItem.tintColor = .black
        monthlyViewButtonItem.tintColor = .black
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}


