//
//  EmptyMonth.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 14/05/25.
//

import UIKit

class EmptyMonth: UIView {

    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    

}
