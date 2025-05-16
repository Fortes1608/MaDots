//
//  MonthDetails+CollectionViewLayout.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit


typealias Size = NSCollectionLayoutSize
typealias Item = NSCollectionLayoutItem
typealias Group = NSCollectionLayoutGroup
typealias Section = NSCollectionLayoutSection
typealias Layout = UICollectionViewCompositionalLayout
typealias Edges = NSDirectionalEdgeInsets
typealias Config = UICollectionViewCompositionalLayoutConfiguration

extension MonthDetailsViewController {
    
    func createLayout() -> NSCollectionLayoutSection {
        
        //MARK: ITEMS OF FIRST GROUP
        let itemSizeFirstGroup = Size(widthDimension: .fractionalWidth(1.0/3),
                                                        heightDimension: .absolute(105))
        
        let itemFirstGroup = Item(layoutSize: itemSizeFirstGroup)
        
        //MARK: FIRST GROUP
        let groupFirstSize = Size(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .absolute(105))
        
        let HorizontalFirstGroup = Group.horizontal(
            layoutSize: groupFirstSize,
            repeatingSubitem: itemFirstGroup,
            count: 3)
        
        HorizontalFirstGroup.interItemSpacing = .fixed(16.0)
        //------------------
        
        // second Item
        let itemSizeSecondGroup = Size(widthDimension: .fractionalWidth(1.0/2),
                                                         heightDimension: .absolute(100))
        
        let itemSecondGroup = Item(layoutSize: itemSizeSecondGroup)
        // second Group
        let groupSecondSize = Size(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        
        //obs: esse 0.515 veio de uma conta e está correto, confia.
        let HorizontalSecondGroup = Group.horizontal(
            layoutSize: groupSecondSize,
            repeatingSubitem: itemSecondGroup,
            count: 2)
        HorizontalSecondGroup.interItemSpacing = .fixed(16.0)
        
        let groupVerticalSize = NSCollectionLayoutSize(widthDimension: .absolute(486), heightDimension: .absolute(253))
        
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupVerticalSize,
                                                             subitems: [HorizontalFirstGroup,HorizontalSecondGroup])
        verticalGroup.interItemSpacing = .fixed(16)
        
        /// section
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        section.interGroupSpacing = 8.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        section.decorationItems
        /// layout
        //        let layout = UICollectionViewCompositionalLayout(section: section)
        return section
    }
    
    func createLayout2() -> NSCollectionLayoutSection {
        //MARK: ITEMS OF FIRST GROUP
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(120),
                                                        heightDimension: .absolute(109))
        
        let itemGourp = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //MARK: FIRST GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .absolute(105))
        
        let horizontalFirstGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: itemGourp,
            count: 3)
        
        horizontalFirstGroup.interItemSpacing = .fixed(16.0)
        
        /// section
        let section = NSCollectionLayoutSection(group: horizontalFirstGroup)
        
        section.interGroupSpacing = 8.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        

        return section
    }
    
    func monthDetailCollectionLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch sectionIndex {
            case 0 :
                return self.createLayout()
            default:
                return self.createLayout2()
            }
        }
        
        return layout
    }
}
