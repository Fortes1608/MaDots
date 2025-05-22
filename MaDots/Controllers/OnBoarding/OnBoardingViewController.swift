//
//  OnBoardingViewController.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 20/05/25.
//
import UIKit
class OnBoardingViewController: UIViewController {
    lazy var trackLabel: UILabel = {
        var label = UILabel()
        label.text = "Track focus, not pressure."
        label.numberOfLines = 2
        label.textColor = .labelPrimary
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var description1Label: UILabel = {
        var label = UILabel()
        label.text = "Each dot marks 15 minutes of"
        label.textColor = .labelPrimary
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    lazy var description2Label: UILabel = {
        var label = UILabel()
        label.text = "real attention."
        label.textColor = .labelPrimary
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    lazy var description3Label: UILabel = {
        var label = UILabel()
        label.text = "No goals. No guilt."
        label.textColor = .labelPrimary
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    lazy var description4Label: UILabel = {
        var label = UILabel()
        label.text = "Just presence."
        label.textColor = .labelPrimary
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    lazy var descriptionStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [description1Label, description2Label, description3Label, description4Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    lazy var iphoneImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "iphone"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(.backgroundGray6, for: .normal)
        button.backgroundColor = .buttonsClicked
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func continueAction() {
        let onBoardViewController = UINavigationController(rootViewController: OnBoardingViewController2())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(onBoardViewController)
    }
}
