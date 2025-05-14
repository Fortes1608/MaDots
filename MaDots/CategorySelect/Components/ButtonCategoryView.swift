//
//  buttonsComponent.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 13/05/25.
//

import UIKit
import Foundation



class ButtonCategoryView: UIView {
    
    static var howManySelected: Int = 0
    
    private var isSelected: Bool = false
    
    private lazy var buttonCategoryComponent: UIButton = {
        
        var button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.layer.cornerRadius = 16
        button.titleLabel?.textColor = .black
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonSelectedAction), for: .touchUpInside)
        
        return button
        
    }()
    
    
    @objc func buttonSelectedAction() {
        
        if !isSelected && ButtonCategoryView.howManySelected >= 3 {
            
             return
            
        }

        isSelected.toggle()
        
        if isSelected {
            
            buttonCategoryComponent.backgroundColor = .gray
            ButtonCategoryView.howManySelected += 1
            print(ButtonCategoryView.howManySelected)
            
        } else {
            
            buttonCategoryComponent.backgroundColor = .white
            ButtonCategoryView.howManySelected -= 1
            print(ButtonCategoryView.howManySelected)
            
        }
        
    }
    
    
    var buttonTitle: String {
        
        get { buttonCategoryComponent.titleLabel?.text ?? "" }
        set { buttonCategoryComponent.setTitle(newValue, for: .normal)}
        
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

extension ButtonCategoryView: ViewSetupProtocol {
    func addSubViews() {
        
        addSubview(buttonCategoryComponent)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            buttonCategoryComponent.topAnchor.constraint(equalTo: self.topAnchor),
            buttonCategoryComponent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonCategoryComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonCategoryComponent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonCategoryComponent.heightAnchor.constraint(equalToConstant: 42),
            
        ])
    }
    
    
}
