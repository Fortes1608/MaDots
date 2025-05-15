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
        
        setupHideKeyboardOnTap()
        
    }
    
    //MARK: KEYBOARD DISMISS CONFIG
    func setupHideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
