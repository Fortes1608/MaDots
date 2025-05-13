//
//  ColorPickerViewController.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 13/05/25.
//
import UIKit

class ColorPickerViewController: UIViewController {
    
    private lazy var pickLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selecione três cores"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    let dot1 = DotButtonView()
    let dot2 = DotButtonView()
    let dot3 = DotButtonView()

    private lazy var stackView3Button: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dot1, dot2, dot3])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually // Faz os botões terem o mesmo tamanho
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
    
        dot1.dotColor = UIColor.color2
        dot2.dotColor = UIColor.color1
        dot3.dotColor = UIColor.color3
        
        view.addSubview(pickLabel)
        view.addSubview(stackView3Button)
        
        
        
        NSLayoutConstraint.activate([
            
            pickLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            pickLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackView3Button.topAnchor.constraint(equalTo: pickLabel.bottomAnchor, constant: 32),
            stackView3Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView3Button.heightAnchor.constraint(equalToConstant: 37),
            stackView3Button.widthAnchor.constraint(equalToConstant: 150)
            
            ])
    }
    
}//Fim da classe
