//
//  CategorySelect+CollectionViewLayout.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

extension CategorySelectViewController {
    
    func createAllLayout() -> UICollectionViewLayout {
        
        let layout = CenteredFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 100, height: 42)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return layout
    }
}

//feat chatgpt ->>> ajusta centralizado
class CenteredFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        var rowAttributes: [UICollectionViewLayoutAttributes] = []

        for attr in attributes {
            if attr.representedElementCategory != .cell { continue }

            // Check if we're on a new row
            if attr.frame.origin.y >= maxY {
                centerRow(rowAttributes, totalWidth: collectionViewContentSize.width)
                rowAttributes.removeAll()
                leftMargin = sectionInset.left
                maxY = attr.frame.origin.y + attr.frame.height
            }

            attr.frame.origin.x = leftMargin
            leftMargin += attr.frame.width + minimumInteritemSpacing
            rowAttributes.append(attr)
        }

        // Center the last row
        centerRow(rowAttributes, totalWidth: collectionViewContentSize.width)

        return attributes
    }

    private func centerRow(_ row: [UICollectionViewLayoutAttributes], totalWidth: CGFloat) {
        guard row.first != nil else { return }

        let totalRowWidth = row.reduce(0) { $0 + $1.frame.width } +
            CGFloat(row.count - 1) * minimumInteritemSpacing

        let inset = max(0, (totalWidth - totalRowWidth) / 2)
        var left = inset

        for attr in row {
            
            attr.frame.origin.x = left
            left += attr.frame.width + minimumInteritemSpacing
            
        }
    }
}

//configura o tamanho de cada item para quando entra outro item
extension CategorySelectViewController: UICollectionViewDelegateFlowLayout {
    //func que configura o tamanho de cada item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row < Persistence.returnCategories().count {
            
            let category = Persistence.returnCategories()[indexPath.row]

            let font = UIFont.systemFont(ofSize: 17, weight: .regular)
            let width = category.size(withAttributes: [NSAttributedString.Key.font: font]).width + 32
            let height: CGFloat = 42
            
            return CGSize(width: width, height: height)
        }
        
        // the value is defined at TextFieldCell, thats why the value defineded overhere doenst matter.
        return CGSize(width: 0, height: 0)

    }
}
