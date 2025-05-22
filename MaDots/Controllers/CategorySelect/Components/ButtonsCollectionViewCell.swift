//
//  CustomCollectionViewCell.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 14/05/25.
//

import UIKit

class ButtonsCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CustomCollectionViewCell"
    
    static var howManySelected: Int = 0
    
    private(set) var isButtonSelected: Bool = false
    
    private(set) var titleOfItem: String?

    private lazy var categoryButton: UIButton = {
        
        var button = UIButton(configuration: .borderless(), primaryAction: nil)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.layer.cornerRadius = 16
        button.titleLabel?.textColor = .black
        button.backgroundColor = .fillsSecondary
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonSelectedAction), for: .touchUpInside)
        
        return button
        
    }()
    
    func configureButton(title: String, isSelected: Bool) {
        
        let attributes: [NSAttributedString.Key: Any] = [
            
            .font: UIFont.systemFont(ofSize: 17, weight: .regular),
            .foregroundColor: UIColor.black
            
        ]
        
        let attributTitle = AttributedString(title, attributes: AttributeContainer(attributes))

        titleOfItem = title
        isButtonSelected = isSelected
        self.categoryButton.setAttributedTitle(NSAttributedString(attributTitle), for: .normal)
        self.categoryButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        self.categoryButton.layer.cornerRadius = 16
        
    }
    
    // Configuration to allow a maximum of three buttons to be selected.
    @objc func buttonSelectedAction() {
        
        if !isButtonSelected && ButtonsCollectionViewCell.howManySelected >= 3 {
            
            return
            
        }
        
        isButtonSelected.toggle()
        
        if isButtonSelected {
            
            categoryButton.backgroundColor = .labelSecondary
            ButtonsCollectionViewCell.howManySelected += 1
            print(ButtonsCollectionViewCell.howManySelected)

        } else {
            
            categoryButton.backgroundColor = .fillsSecondary
            ButtonsCollectionViewCell.howManySelected -= 1
            print(ButtonsCollectionViewCell.howManySelected)
            
        }
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

extension ButtonsCollectionViewCell: ViewSetupProtocol {
    func addSubViews() {
        
        addSubview(categoryButton)

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            categoryButton.topAnchor.constraint(equalTo: self.topAnchor),
            categoryButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            categoryButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
        ])
    }
}



