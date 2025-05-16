//
//  EightDotsStack.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 15/05/25.
//

import UIKit

class EightDotsStack: UIStackView{

     let dot1 = DotButtonView()
     let dot2 = DotButtonView()
     let dot3 = DotButtonView()
     let dot4 = DotButtonView()
     let dot5 = DotButtonView()
     let dot6 = DotButtonView()
     let dot7 = DotButtonView()
     let dot8 = DotButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
        dot1.dotColor = UIColor.fillColorSecondary
        dot2.dotColor = UIColor.fillColorSecondary
        dot3.dotColor = UIColor.fillColorSecondary
        dot4.dotColor = UIColor.fillColorSecondary
        dot5.dotColor = UIColor.fillColorSecondary
        dot6.dotColor = UIColor.fillColorSecondary
        dot7.dotColor = UIColor.fillColorSecondary
        dot8.dotColor = UIColor.fillColorSecondary
   }

    required init(coder: NSCoder) {
         super.init(coder: coder)
         setupStack()
    }
    
    override func draw(_ rect: CGRect) {
         
    }
   

    private func setupStack() {
        self.axis = .horizontal
        self.spacing = 8
        self.alignment = .center
        self.distribution = .equalSpacing
        addArrangedSubview(dot1)
        addArrangedSubview(dot2)
        addArrangedSubview(dot3)
        addArrangedSubview(dot4)
        addArrangedSubview(dot5)
        addArrangedSubview(dot6)
        addArrangedSubview(dot7)
        addArrangedSubview(dot8)
    }
}
extension EightDotsStack: ViewSetupProtocol {
    func addSubViews() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
}
