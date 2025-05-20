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
        
        if ButtonsCollectionViewCell.howManySelected >= 1 {
            
            let colorPickerVC = MatrixViewController()
            navigationController?.pushViewController(colorPickerVC, animated: true)
                    
            colorPickerVC.receivedCategories = takeSelectedItens()
            
        } else {
            
            let alertController = UIAlertController(title: "No Categories", message: "Please, select at least one category", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(alertAction)
            
            present(alertController, animated: true)
        }
    }
}
