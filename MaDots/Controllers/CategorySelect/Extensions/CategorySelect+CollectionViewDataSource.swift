//
//  CategorySelect+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

extension CategorySelectViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if titles.count < 16 {
            
            return titles.count + 1
            
        } else {
            
            return titles.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        //0,...,12
        let index = indexPath.row
        //de zero até 13, entre aqui
        if index < titles.count {
            
            guard let buttonCell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsCollectionViewCell.identifier, for: indexPath) as? ButtonsCollectionViewCell else {fatalError("erro")}
            
            let title = titles[index]
            
            buttonCell.configureButton(title: title, isSelected: false)
            buttonCell.delegate = self
            
            return buttonCell
            
        } else {
            //restante (14 entra aqui)
            guard let textFieldCell = collectionView.dequeueReusableCell(withReuseIdentifier: TextFieldCollectionViewCell.identifier, for: indexPath) as? TextFieldCollectionViewCell else { fatalError("erro") }
            
            textFieldCell.delegate = self

            return textFieldCell
            
        }
    }
    
}

