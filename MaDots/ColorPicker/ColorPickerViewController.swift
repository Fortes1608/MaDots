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
    //let singleDot = DotButtonView()
    
    var dotGroups: [ThreeDotsStack] = [] //Array vazia de dots
    var selectedColors: [Int: UIColor] = [:] //Par linha-cor
    var usedColors: Set<UIColor> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(pickLabel)
        //view.addSubview(singleDot)
        
        //        singleDot.translatesAutoresizingMaskIntoConstraints = false
        //
        NSLayoutConstraint.activate([
            pickLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            pickLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        setupDotLines(numberOfLines: 3)
    }//Fim do viewdidload
        
        func setupDotLines(numberOfLines: Int){
            for i in 0..<numberOfLines{
                let stack = ThreeDotsStack()
                stack.assignColors([.color1, .color2, .color3], groupID: i, target: self, action: #selector(dotTapped(_:)))
                stack.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(stack)
                
                NSLayoutConstraint.activate([
                    stack.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(150 + (i * 60))),
                    stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
                
                dotGroups.append(stack)
            }
        }
        
        
    @objc func dotTapped(_ sender: DotButtonView) {
        // ⚠️ Se estiver em cinza e não for a cor real do botão, ignorar
        if sender.backgroundColor == .gray{
            print("Tentou tocar em cinza de outro grupo — ignorado")
            return
        }

        guard sender.isSelectable else {
            print("Dot bloqueado — ignorando toque")
            return
        }

        let selectedColor = sender.dotColor
        let groupID = sender.groupID

        print("TOCOU UM DOT — Linha \(groupID), Cor \(selectedColor.accessibilityName)")

        selectedColors[groupID] = selectedColor
        usedColors = Set(selectedColors.values)

        blink(dot: sender)
        updateDotStates()
    }
        
        func blink(dot: DotButtonView) {
            UIView.animate(withDuration: 0.1, animations: {
                dot.alpha = 0.2
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    dot.alpha = 1.0
                }
            }
        }
        
    func updateDotStates() {
        for group in dotGroups {
            if let selectedColor = selectedColors[group.groupID] {
                for dot in [group.dot1, group.dot2, group.dot3] {
                    if dot.dotColor == selectedColor {
                        dot.backgroundColor = dot.dotColor
                        dot.isSelectable = true
                    } else {
                        dot.backgroundColor = .gray
                        dot.isSelectable = true // Ainda pode clicar para trocar
                    }
                }
            } else {
                for dot in [group.dot1, group.dot2, group.dot3] {
                    if usedColors.contains(dot.dotColor) {
                        dot.backgroundColor = .gray
                        dot.isSelectable = false // Bloqueado, pertence a outro grupo
                    } else {
                        dot.backgroundColor = dot.dotColor
                        dot.isSelectable = true
                    }
                }
            }
        }
    }
        
    
}//Fim da classe
