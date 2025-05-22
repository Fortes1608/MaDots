//
//  OnBoardingViewController2ViewController.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 20/05/25.
//
import UIKit
class OnBoardingViewController2: UIViewController {
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "How It Works"
        label.textColor = .labelPrimary
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var description1: DescriptionComponent = {
        var descriptionComponent = DescriptionComponent()
        return descriptionComponent
    }()
    lazy var description2: DescriptionComponent = {
        var descriptionComponent = DescriptionComponent()
        descriptionComponent.boldText = "Start with a tap"
        descriptionComponent.normalText = "Launch a 15-minute timer. When it ends, one dot is added to your timeline."
        descriptionComponent.dotImage.dotColor = .orange
        return descriptionComponent
    }()
    lazy var description3: DescriptionComponent = {
        var descriptionComponent = DescriptionComponent()
        descriptionComponent.boldText = "Notice your patterns"
        descriptionComponent.normalText = "Subtle insights help you see when — and how — you focus best. No charts. No noise."
        descriptionComponent.dotImage.dotColor = .teal
        return descriptionComponent
    }()
    
    lazy var bigStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [description1, description2, description3])
        stack.spacing = 40
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.fillsWhite, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(getStartedAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func getStartedAction() {
        let categoryViewController = UINavigationController(rootViewController: CategorySelectViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(categoryViewController)
        ButtonsCollectionViewCell.howManySelected = 0
        
        
    }
}

