//
//  buttonsComponent.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 13/05/25.
//

import UIKit

class ButtonCategoryView: UIView {
    
    private lazy var buttonCategoryComponent: UIButton = {
       
        var button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.layer.cornerRadius = 16
        button.titleLabel?.textColor = .black
        button.setTitleColor(.white, for: .normal)
        
        return button
        
    }()
    
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
    func makeConstraints() {
        
    }
    
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
