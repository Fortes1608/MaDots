//
//  ThreeDotsStack.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 14/05/25.
//
import UIKit

class ThreeDotsStack: UIStackView {
    
    let dot1 = DotButtonView()
    let dot2 = DotButtonView()
    let dot3 = DotButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
        dot1.dotColor = UIColor.color2
        dot2.dotColor = UIColor.color1
        dot3.dotColor = UIColor.color3
   }
   
   required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStack()
   }
    
    private func setupStack() {
        self.axis = .horizontal
        self.spacing = 8
        self.alignment = .center
        self.distribution = .equalSpacing
        
        addArrangedSubview(dot1)
        addArrangedSubview(dot2)
        addArrangedSubview(dot3)
    }
}//Fim da classe
   
extension ThreeDotsStack: ViewSetupProtocol{
    func setupConstraints() {
        NSLayoutConstraint.activate([
         
        ])
    }
    
    func addSubViews() {
        
    }
}
