//
//  MatrizViewController.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 16/05/25.
//

import UIKit

class MatrixViewController: UIViewController {
    
    private lazy var pickLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selecione três cores"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        return button
    }()
    
    lazy var categoriesStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        categories.forEach { category in
            var label = UILabel()
            label.text = category
            stack.addArrangedSubview(label)
        }
        return stack
    }()
    
    lazy var matrixView: MatrixView = {
        var matrixView = MatrixView()
        matrixView.translatesAutoresizingMaskIntoConstraints = false
        matrixView.spacing = 8
        matrixView.dataSource = self
        matrixView.delegate = self
        return matrixView
    }()
    
    lazy var mainStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [categoriesStack, matrixView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        return stack
    }()
    
    var colors: [UIColor] = [UIColor.color2, UIColor.color1, UIColor.color3]
    
    var categories: [String] = ["Study",
                                "Work",
                                "Lunch",]
    
    var selection: [UIColor?] = [nil,
                                 nil,
                                 nil] {
        didSet {
            matrixView.reloadData()
        }
    }
    @objc func continueAction() {
        let mdeViewController = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mdeViewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        view.addSubview(pickLabel)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            pickLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            pickLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -46)
        ])
        
        
    }

}

extension MatrixViewController: MatrixViewDataSource {
    
    //Numero de colunas
    func dimension(of matrixView: MatrixView) -> Int {
        //Define quantas linhas baseadas em quantas categorias
        return categories.count
    }
    
    func matrix(_ matrixView: MatrixView, itemFor coordinate: Coordinate) -> MatrixItem {
        let currentColor = colors[coordinate.column]
        let item = MatrixImageView(image: UIImage(systemName: "circle.fill"))
        
        // Cor padrão para itens não selecionados
        item.tintColor = .gray

        if let selectedColor = selection[coordinate.row] {
            // A cor dessa linha foi selecionada e corresponde à cor atual da coluna
            if selectedColor == currentColor {
                item.tintColor = currentColor
            }
        } else {
            // Essa linha ainda não selecionou nenhuma cor — mostrar a cor disponível
            item.tintColor = currentColor
        }

        return item
    }
    
}

extension MatrixViewController: MatrixViewDelegate {
    
    func matrix(_ matrixView: MatrixView, didSelectItemAt coordinate: Coordinate) {
        let selectedColor = colors[coordinate.column]

        // A cor já foi selecionada por outra categoria?
        if let existingIndex = selection.firstIndex(of: selectedColor), existingIndex != coordinate.row {
            
            // Eu já tenho uma cor atribuída?
            if let currentColor = selection[coordinate.row] {
                // Troca as cores entre as categorias
                selection[existingIndex] = currentColor
            } else {
                // Procurar uma cor não utilizada para realocar a categoria anterior
                if let replacementColor = colors.first(where: { !selection.contains($0) && $0 != selectedColor }) {
                    selection[existingIndex] = replacementColor
                }
            }
        }
        
        // A cor está disponível ou já era minha
        selection[coordinate.row] = selectedColor
        
    }
}

extension MatrixViewController: ViewSetupProtocol {

    func addSubViews() {
        view.addSubview(mainStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
