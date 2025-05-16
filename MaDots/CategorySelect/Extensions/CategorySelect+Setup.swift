//
//  CategorySelect+Setup.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//
import UIKit

extension CategorySelectViewController:ViewSetupProtocol {
    
    func addSubViews() {
        
        view.addSubview(mainTitle)
        view.addSubview(buttonFooter)
        view.addSubview(collection)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 87),
            mainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -78),
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 78),
            
            collection.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 75),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collection.bottomAnchor.constraint(equalTo: buttonFooter.topAnchor, constant: -150),
            
            buttonFooter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -46),
            buttonFooter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonFooter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .background
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        // add gesture recognizer in view...
        view.addGestureRecognizer(tap)
        
        // add gesture recognizer in collection...
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        collection.addGestureRecognizer(longPress)
        
    }

    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            //this point have the exactly location where the user pressed
            let point = gesture.location(in: collection)
            // finding the indexPath by the location
            if let indexPath = collection.indexPathForItem(at: point), indexPath.row < titles.count {
                
                let alert = UIAlertController(title: "Delete", message: "Do you want to delete this category?", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
                    
                    // in case of deleting a selected item
                    ButtonsCollectionViewCell.howManySelected = 0
                    
                    self.titles.remove(at: indexPath.row)
                    self.collection.reloadData()

                })

                present(alert, animated: true)
                
            }
        }
    }
}
