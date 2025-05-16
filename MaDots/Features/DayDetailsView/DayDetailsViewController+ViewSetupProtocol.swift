//
//  DayDetailsViewController+ViewSetupProtocol.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit
// MARK: ViewCodeProtocol
extension DayDetailsViewController: ViewSetupProtocol {
    
    func addSubViews() {
        view.addSubview(bigStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            bigStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bigStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bigStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 144)
        ])
    }
}

