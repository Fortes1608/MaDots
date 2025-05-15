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
    
    let threeDotsStack = ThreeDotsStack()
    
    var dotGroups: [[DotButtonView]] = []
    var usedColors: [UIColor: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(pickLabel)
        setupStackView3Button()
        threeDotsStack.dot1.addTarget(self, action: #selector(dot1Tapped), for: .touchUpInside)
        threeDotsStack.dot2.addTarget(self, action: #selector(dot2Tapped), for: .touchUpInside)
        threeDotsStack.dot3.addTarget(self, action: #selector(dot3Tapped), for: .touchUpInside)
    }
    
    @objc func dot1Tapped() {
        print("dot1Tapped")
        
        //Caso já seja cinza
        if threeDotsStack.dot1.backgroundColor == .gray {
            threeDotsStack.dot1.backgroundColor = .color2
            threeDotsStack.dot2.backgroundColor = .gray
            threeDotsStack.dot3.backgroundColor = .gray
        }
        threeDotsStack.dot2.backgroundColor = .gray
        threeDotsStack.dot3.backgroundColor = .gray
    }
    
    @objc func dot2Tapped() {
        print("dot2Tapped")
        //Caso clique e já seja cinza, colore de novo
        if threeDotsStack.dot2.backgroundColor == .gray {
            threeDotsStack.dot2.backgroundColor = .color1
            threeDotsStack.dot1.backgroundColor = .gray
            threeDotsStack.dot3.backgroundColor = .gray
        }
        threeDotsStack.dot1.backgroundColor = .gray
        threeDotsStack.dot3.backgroundColor = .gray
    }
    
    @objc func dot3Tapped() {
        print("dot3Tapped")
        if threeDotsStack.dot3.backgroundColor == .gray {
            threeDotsStack.dot3.backgroundColor = .color3
            threeDotsStack.dot1.backgroundColor = .gray
            threeDotsStack.dot2.backgroundColor = .gray
        }
        threeDotsStack.dot1.backgroundColor = .gray
        threeDotsStack.dot2.backgroundColor = .gray
    }
    
    
    private func setupStackView3Button() {
        view.addSubview(threeDotsStack)
        threeDotsStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            pickLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            pickLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            threeDotsStack.topAnchor.constraint(equalTo: pickLabel.bottomAnchor, constant: 32),
            threeDotsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            threeDotsStack.heightAnchor.constraint(equalToConstant: 37),
            threeDotsStack.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}//Fim da classe
