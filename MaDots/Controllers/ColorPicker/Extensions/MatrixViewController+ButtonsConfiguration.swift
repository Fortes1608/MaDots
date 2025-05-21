//
//  ButtonsConfiguration.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 21/05/25.
//

import Foundation

extension MatrixViewController {
    
    
    
    @objc func customBackAction() {
        
        ButtonsCollectionViewCell.howManySelected = 0
        navigationController?.popToRootViewController(animated: true)
        delegate?.reloadData()
        
        
    }
    
}
