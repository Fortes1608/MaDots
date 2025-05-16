//
//  MonthDetails+CollectionViewLayout.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

extension MonthDetailsViewController {
    
    func createLayout() -> NSCollectionLayoutSection {
        //MARK: ITEMS OF FIRST GROUP
        let itemSizeFirstGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3),
                                                        heightDimension: .fractionalHeight(1.0))
        let itemFirstGroup = NSCollectionLayoutItem(layoutSize: itemSizeFirstGroup)
        
        //MARK: FIRST GROUP
        let groupFirstSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .fractionalHeight(0.5))
        
        let HorizontalFirstGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupFirstSize,
            repeatingSubitem: itemFirstGroup,
            count: 3)
        
        HorizontalFirstGroup.interItemSpacing = .fixed(16.0)
        //------------------
        
        // second Item
        let itemSizeSecondGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                         heightDimension: .fractionalHeight(1.0))
        let itemSecondGroup = NSCollectionLayoutItem(layoutSize: itemSizeSecondGroup)
        // second Group
        let groupSecondSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(105))
        
        let HorizontalSecondGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSecondSize,
            repeatingSubitem: itemSecondGroup,
            count: 2)
        HorizontalSecondGroup.interItemSpacing = .fixed(16.0)

        
        
        let groupVerticalSize = NSCollectionLayoutSize(widthDimension: .absolute(486), heightDimension: .absolute(253))
        
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupVerticalSize,
                                                             subitems: [HorizontalFirstGroup,HorizontalSecondGroup])
        verticalGroup.interItemSpacing = .fixed(16.0)
        
        /// section
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        section.interGroupSpacing = 8.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        /// layout
        //        let layout = UICollectionViewCompositionalLayout(section: section)
        return section
    }
    
    func createAllLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.createLayout()
        }
        
        return layout
    }
}
