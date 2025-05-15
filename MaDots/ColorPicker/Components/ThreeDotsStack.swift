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
    var groupID: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
//        dot1.dotColor = UIColor.color2
//        dot2.dotColor = UIColor.color1
//        dot3.dotColor = UIColor.color3
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
        translatesAutoresizingMaskIntoConstraints = false
        
        
        addArrangedSubview(dot1)
        addArrangedSubview(dot2)
        addArrangedSubview(dot3)
    }
    
    func assignColors(_ colors: [UIColor], groupID: Int, target: Any, action: Selector) {
        self.groupID = groupID
        [dot1, dot2, dot3].enumerated().forEach { (index, dot) in
            dot.groupID = groupID
            dot.tag = index
            dot.dotColor = colors[index]
            dot.addTarget(target, action: action, for: .touchUpInside)
        }
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
