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
        label.textColor = UIColor.labelPrimary
        return label
    }()
    
    private lazy var continueButton: ButtonFooterView = {
        
        let button = ButtonFooterView()
                
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Continue"
        button.onTap = continueButtonAction
        button.layer.cornerRadius =  16
        button.backgroundColor = UIColor.buttonsStill
        
        
        return button

    }()
    
    lazy var categoriesStack: UIStackView = {
        var stack = UIStackView()
        
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.spacing = 24
        
        categories?.forEach { category in
            
            var label = BackgroundShrinkLabel(text: category)
            
            label.backgroundColor = .fillsSecondary
            label.layer.cornerRadius = 16
            label.clipsToBounds = true
            label.setContentHuggingPriority(.required, for: .vertical)
            label.setContentCompressionResistancePriority(.required, for: .vertical)

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

    var colors: [UIColor] = [UIColor.teal, UIColor.indigo, UIColor.orange]
        
    var categories: [String]?

    var selection: [UIColor?] = [] {
        didSet {
            matrixView.reloadData()
            let allColorsSelected = selection.compactMap { $0 }.count == categories?.count
            changeContinueButtonColor(allColorsSelected: allColorsSelected)
            continueButton.layer.cornerRadius = 20
        }
    }
    @objc func continueAction() {
        let mdeViewController = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mdeViewController)
    }

    func changeContinueButtonColor(allColorsSelected: Bool) {
        
        continueButton.backgroundColor = allColorsSelected ? UIColor.buttonsClicked : UIColor.buttonsStill
      
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
            
    
            let navigationController = UINavigationController()
            navigationController.viewControllers = [FlowViewController()]
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(navigationController)
            
        } else {
            
            let alertController = UIAlertController(title: "Select your colors", message: "Please, select a color for each category.", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(alertAction)
            
            present(alertController, animated: true)
            
        }
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Initialize selection array based on actual category count
        if selection.isEmpty {
            selection = Array(repeating: nil, count: categories?.count ?? 0)
        }
        
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

class BackgroundShrinkLabel: UIView {
    let label = UILabel()

    init(text: String) {
        super.init(frame: .zero)

        backgroundColor = .systemGray5
        layer.cornerRadius = 10
        clipsToBounds = true

        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        self.heightAnchor.constraint(equalToConstant: 42).isActive = true
        self.widthAnchor.constraint(equalToConstant: 101).isActive = true


        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


