//
//  DotButton.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 13/05/25.
//
import UIKit

class DotButtonView: UIButton {
    

    var originalColor: UIColor = UIColor.secondaryLabel  //Cor padrão do botao (cinza)
    var groupID: Int = 0 //"Linha" do botao
    var isSelectable: Bool = true //Teste?

    
    var dotColor: UIColor {
        get { backgroundColor ?? .clear }
        set {
            backgroundColor = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 31.13).isActive = true
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        //backgroundColor = UIColor.labelSecondary
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
}
    
