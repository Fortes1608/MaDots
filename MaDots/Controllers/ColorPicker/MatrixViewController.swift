//
//  MatrizViewController.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 16/05/25.
//

import UIKit

protocol BackButtonDelegate: AnyObject {
    func reloadData()
}

class MatrixViewController: UIViewController {
    
    weak var delegate: BackButtonDelegate?
    
    private lazy var pickLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select your colors"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var continueButton: ButtonFooterView = {
        
        let button = ButtonFooterView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Continue"
        button.onTap = continueButtonAction
        
        
        return button
        
    }()
    
    lazy var categoriesStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        categories?.forEach { category in
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
        
    var categories: [String]?

    var selection: [UIColor?] = [nil,
                                 nil,
                                 nil] {
        didSet {
            matrixView.reloadData()
        }
    }

    func savingPickedColors() {
        guard let cats = categories else { return }
        var dict: [String: UIColor] = [:]

        for i in 0..<cats.count {
            if let color = selection[i] {
                dict[cats[i]] = color
            }
        }
        
        Persistence.savingCategoriesWithColorDict(dict)
    }
    
    func continueButtonAction() {
        savingPickedColors()
        
        if categories?.count == Persistence.loadCategoriesWithColor()?.count {
            
            let yearVC = YearViewController()
            let navController = UINavigationController(rootViewController: yearVC)
            
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = navController
                sceneDelegate.window?.makeKeyAndVisible()
            
            }
        } else {
            
            let alertController = UIAlertController(title: "Select your colors", message: "Please, select a color for each category.", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(alertAction)
            
            present(alertController, animated: true)
            
        }
       

//        if let savedColor = Persistence.loadCategoriesWithColor(),
//           let color = savedColor["Exercise"] {
//            view.backgroundColor = color
//        }
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
        
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(customBackAction))
        
        
    }
    
    
}




