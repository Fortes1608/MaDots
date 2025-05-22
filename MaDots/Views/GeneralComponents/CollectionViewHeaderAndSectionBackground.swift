//
//  CollectionViewHeader.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 19/05/25.
//

import UIKit

final class HeaderCollectionView: UICollectionReusableView {
    
    static let reuseIdentifier = "SimpleHeaderView"

    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .label
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with text: String) {
        titleLabel.text = text

    }
}

//section config
final class SectionBackgroundView: UICollectionReusableView {
    
    static let elementKind = "section-background-element"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .fillsSecondary
        layer.cornerRadius = 16
        layer.masksToBounds = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
