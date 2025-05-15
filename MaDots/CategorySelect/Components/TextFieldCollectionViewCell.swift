//
//  TextFieldCollectionViewCell.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

class TextFieldCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TextFieldCollectionViewCell"
        
    lazy var otherTextField: UITextField = {
       
        var textField = UITextField()

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 16
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Write here your category", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]
        )
        
        return textField
        
    }()
    
    //MARK: INITS
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
}

extension TextFieldCollectionViewCell: ViewSetupProtocol {
    
    func addSubViews() {
        
        addSubview(otherTextField)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            otherTextField.topAnchor.constraint(equalTo: self.topAnchor),
            otherTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            otherTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            otherTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
}
