//
//  MatrixViewController+Setup.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 21/05/25.
//

import UIKit

extension MatrixViewController: ViewSetupProtocol {

    func addSubViews() {
        
        view.addSubview(categoriesStack)
        view.addSubview(matrixView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            categoriesStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            categoriesStack.topAnchor.constraint(equalTo: view.topAnchor , constant: 286),
            categoriesStack.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -219.5),
            
            matrixView.topAnchor.constraint(equalTo: view.topAnchor, constant: 282),
            matrixView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      
            
        ])
    }
    
}
