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

extension CategorySelectViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(indexPath.row)
        
        if indexPath.row < titles.count {
            
            let category = titles[ indexPath.row ]
            let font = UIFont.systemFont(ofSize: 17, weight: .regular)
            let width = category.size(withAttributes: [NSAttributedString.Key.font: font]).width + 32.2
            let height: CGFloat = 42
            
            return CGSize(width: width, height: height)
        }
        
        // the value is defined at TextFieldCell, thats why the value defineded overhere doenst matter.
        return CGSize(width: 0, height: 0)

    }
}
