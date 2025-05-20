//
//  MonthDetails+CollectionViewLayout.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

extension DayDetailViewController {
    
    func sectionZeroLayout() -> NSCollectionLayoutSection {
        //MARK: ITEMS OF FIRST GROUP
        let itemSize = Size(widthDimension: .estimated(160),
                            heightDimension: .fractionalHeight(1.0))
        
        let itemGroup = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //MARK: FIRST GROUP
        let groupSize = Size(widthDimension: .absolute(540),
                             heightDimension: .absolute(110))

        
        let horizontalFirstGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: itemGroup,
            count: 3)
        
        horizontalFirstGroup.interItemSpacing = .fixed(16.0)
        horizontalFirstGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        
        /// section
        let section = Section(group: horizontalFirstGroup)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(32)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                
        return section
    }
    
    
    func sectionOneLayout() -> Section {
        
        //MARK: ITEMS OF FIRST GROUP
        let itemSizeFirstGroup = Size(widthDimension: .fractionalWidth(1.0/2),
                                      heightDimension: .fractionalHeight(1.0))
        
        let itemFirstGroup = Item(layoutSize: itemSizeFirstGroup)
        
        //MARK: FIRST GROUP
        let groupFirstSize = Size(widthDimension: .fractionalWidth(1.0),
                                  heightDimension: .absolute(119))
        
        let HorizontalFirstGroup = Group.horizontal(
            layoutSize: groupFirstSize,
            repeatingSubitem: itemFirstGroup,
            count: 2)
        
        HorizontalFirstGroup.interItemSpacing = .fixed(16.0)
        //------------------
        
        // second Item
        let itemSizeSecondGroup = Size(widthDimension: .fractionalWidth(1.0),
                                       heightDimension: .fractionalHeight(1.0))
        
        let itemSecondGroup = Item(layoutSize: itemSizeSecondGroup)
        // second Group
        let groupSecondSize = Size(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(115))
        
        let HorizontalSecondGroup = Group.horizontal(
            layoutSize: groupSecondSize,
            repeatingSubitem: itemSecondGroup,
            count: 1)
        HorizontalSecondGroup.interItemSpacing = .fixed(16.0)
        
        let groupVerticalSize = Size(widthDimension: .absolute(361), heightDimension: .absolute(250))
        
        
        let verticalGroup = Group.vertical(layoutSize: groupVerticalSize,
                                                             subitems: [HorizontalFirstGroup,HorizontalSecondGroup])
        verticalGroup.interItemSpacing = .fixed(16)
        verticalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        /// section
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        //header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(32))

        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
                
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 8.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16)
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
    
    
        
    func collectionViewLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 24

        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let section: NSCollectionLayoutSection

            switch sectionIndex {
            case 0:
                section = self.sectionZeroLayout()
            default:
                section = self.sectionOneLayout()
            }

            // Aplica o decorationItem (background) para cada section
            let decorationItem = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundView.elementKind)
            decorationItem.contentInsets = NSDirectionalEdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0)
            section.decorationItems = [decorationItem]

            return section
        }, configuration: config)

        // Registra a Decoration View (fundo da section)
        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
        
        return layout
    }
}




