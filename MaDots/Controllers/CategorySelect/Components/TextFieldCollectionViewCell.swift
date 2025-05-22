//
//  TextFieldCollectionViewCell.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

class TextFieldCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    
    static let identifier: String = "TextFieldCollectionViewCell"
    
    weak var delegate: UITextFieldDelegate?
        
    lazy var otherTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 16
        textField.delegate = self
        textField.backgroundColor = .fillsWhite
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "Write here your category",
            attributes: [
                .foregroundColor: UIColor.secondaryLabel,
                .font: UIFont.systemFont(ofSize: 16, weight: .medium)
            ])

        // Padding with a view to the left and the right
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.rightView = padding
        textField.rightViewMode = .always

        return textField
        
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? true
    }


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
            otherTextField.heightAnchor.constraint(equalToConstant: 42)

            
        ])
    }
}
