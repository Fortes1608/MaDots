//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension MonthDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 5
        case 1: return 3
        default: return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("erro") }
        
        if indexPath.section == 0 {
            
            let upperLabels = ["Category","Time","Total", "Focus Day","Maximum Sessions"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
            
            
        } else if  indexPath.section == 1 {
            
            let upperLabels = ["Sections","total Time","active days"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
            
        } else if indexPath.section == 2 {
            
            let upperLabels = ["First Section","active Media","sequence of days","Hours per week"]
            let labelForCell = upperLabels[indexPath.item]
            
            //func recebe dados de tempo, foco etc
            
            cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
            
            return cell
            
        } else {
            
            let upperLabels = ["Best Week","schedule with more focus ","day of week","more continuous focus"]
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
                case 0: header.configure(with: "Highlights of the month")
                    return header
                case 1: header.configure(with: "Full Focus")
                    return header
                case 2: header.configure(with: "Consistence and Rhythm")
                    return header
                default:header.configure(with: "Time Patterns")
                    return header
                }
                
            }
            fatalError("Unexpected element kind")
        }
    
}
