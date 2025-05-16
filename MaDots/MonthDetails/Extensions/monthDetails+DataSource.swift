//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension MonthDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 5
            
        } else if section == 1 {
            
            return 3
            
        }
      
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthDetailsCollectionViewCell.monthIdentifier, for: indexPath) as? MonthDetailsCollectionViewCell else { fatalError("erro") }
        
        if indexPath.section == 0 {

            let upperLabels = ["Category","Time","Total", "Focus Day","Maximum Sessions"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
       
            
        } else  /*indexPath.section == 1 */ {
            
            let upperLabels = ["Sections","total Time","active days"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
        }
    }
}
