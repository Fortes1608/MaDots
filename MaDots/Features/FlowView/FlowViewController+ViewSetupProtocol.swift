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
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            toolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emptyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 166),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -418),
        ])
    }
}


