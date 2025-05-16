//
//  monthDetails+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

extension MonthDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthDetailsCollectionViewCell.monthIdentifier, for: indexPath) as? MonthDetailsCollectionViewCell else { fatalError("erro") }
        
        let upperLabels = ["Category","Time","Total", "Focus Day","Maximum Sessions"]
        let labelForCell = upperLabels[indexPath.item]
        
        //func recebe dados de tempo, foco etc
        
        cell.configureCell(upperLabel: labelForCell, lowerLabel: "vou receber", image: nil)
        
        return cell
    }
}
