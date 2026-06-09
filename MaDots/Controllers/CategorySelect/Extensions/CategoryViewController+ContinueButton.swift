//
//  CategoryViewController+ContinueButton.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension CategorySelectViewController {
    
    func takeSelectedItens() -> [String] {
        
        var selecionados: [String] = []
        for cell in collection.visibleCells {
            if let cell = cell as? ButtonsCollectionViewCell, cell.isButtonSelected,
               let titulo = cell.titleOfItem {
                selecionados.append(titulo)
            }
        }
        return selecionados
    }
    
    func buttonAction() {
        
        if ButtonsCollectionViewCell.howManySelected == 3 {
            
            let matrixVC = MatrixViewController()
            matrixVC.delegate = self

            navigationController?.pushViewController(matrixVC, animated: true)
                    
            UserDefaults.standard.set(takeSelectedItens(), forKey: "selectedItens")
            
            matrixVC.categories = UserDefaults.standard.value(forKey: "selectedItens") as? [String]

            
        } else {
            
            let alertController = UIAlertController(title: "Select 3 Categories", message: "Please, select exactly 3 categories to continue.", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(alertAction)
            
            present(alertController, animated: true)
        }
    }
}
