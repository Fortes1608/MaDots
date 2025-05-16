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
            titles.append(newCategory)
            collection.reloadData()
            textField.text = ""
            
        }
        
        textField.resignFirstResponder()
        return true
        
    }
}


