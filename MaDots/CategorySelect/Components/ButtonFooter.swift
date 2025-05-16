//
//  ButtonFooter.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 13/05/25.
//

import UIKit

class ButtonFooterView: UIView {
    
    private lazy var buttonFooterComponent: UIButton = {
       
        var button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.layer.cornerRadius = 16
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.setTitleColor(.white, for: .normal)
        
        return button
        
    }()
    
    var buttonTitle: String {
        
        get { buttonFooterComponent.titleLabel?.text ?? "" }
        set { buttonFooterComponent.setTitle(newValue, for: .normal)}
        
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

extension ButtonFooterView: ViewSetupProtocol {
    func makeConstraints() {
        
    }
    
    func addSubViews() {
        addSubview(buttonFooterComponent)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            buttonFooterComponent.topAnchor.constraint(equalTo: self.topAnchor),
            buttonFooterComponent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonFooterComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonFooterComponent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonFooterComponent.heightAnchor.constraint(equalToConstant: 50),
     
        ])
    }
    
    
}
