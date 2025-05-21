//
//  MatrixViewController+Setup.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 21/05/25.
//

import UIKit

extension MatrixViewController: ViewSetupProtocol {

    func addSubViews() {
        view.addSubview(mainStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            
        ])
    }
    
}
