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
    var groupID: Int = 0 //Id para relacionar com a linha
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
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
        
        
        addArrangedSubview(dot1) //Primeiro dot da linha
        addArrangedSubview(dot2) //Segundo dot da linha
        addArrangedSubview(dot3) //Terceiro dot da linha
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
    func makeConstraints() {
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
         
        ])
    }
    
    func addSubViews() {
        
    }
}
