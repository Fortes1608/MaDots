//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension DayDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("erro") }
        
        if indexPath.section == 0 {
            
            let upperLabels = ["Time","Sections","Total", "Largest Single Focus"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
            
            
        } else if  indexPath.section == 1 {
            
            let upperLabels = ["Total Time","Sections","Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
            
        } else if indexPath.section == 2 {
            
            let upperLabels = ["Total Time","Sections","Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
            
        } else {
            
            let upperLabels = ["Total Time","Sections","Dots"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
            
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath ) -> UICollectionReusableView {
            
            if kind == UICollectionView.elementKindSectionHeader {
                
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderCollectionView.reuseIdentifier, for: indexPath ) as! HeaderCollectionView
                
                switch indexPath.section {
                    
                case 0: header.configure(with: "08 de Maio de 2025")
                    return header
                case 1: header.configure(with: "Meditation")
                    return header
                case 2: header.configure(with: "Work")
                    return header
                default:header.configure(with: "Study")
                    return header
                    
                }
                
            }
            
            fatalError("Unexpected element kind")
            
        }
}
