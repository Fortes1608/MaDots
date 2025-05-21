//
//  CategorySelect+TextFieldDelegate.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

extension CategorySelectViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let newCategory = textField.text, !newCategory.isEmpty {
            Persistence.saveCategory(category: newCategory)
            collection.reloadData()
            ButtonsCollectionViewCell.howManySelected = 0
            textField.text = ""
            
        }
        
        textField.resignFirstResponder()
        return true
        
    }
}


