//
//  DayDetailsViewController.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit

class DayDetailsViewController: UIViewController {
    
    lazy var flowButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setTitle("Flow", for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.tintColor = .black
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(flowButtonTapped), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()
    
    private func date() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd 'de' MMMM 'de' YYYY"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: Date())
    }

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = date()
        label.textColor = .secondaryLabel
        return label
    }()
    
    lazy var separatorView: UIView = {
        var view = UIView()
        view.backgroundColor = .opaqueSeparator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [dateLabel, separatorView])
        stack.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    

    lazy var timeLabel: DetailsLabelComponent = {
        var label = DetailsLabelComponent()
        return label
    }()
    
    private lazy var activityLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.text = "Atividades Realizadas"
        label.textColor = .black
        return label
    }()
    private lazy var flow1Label: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.text = "Meditação: 30 Min"
        label.textColor = .black
        return label
    }()
    
    private lazy var circle1:  DotButtonView = {
        circle1 = DotButtonView()
        circle1.dotColor = .color1
        return circle1
    }()
    
    private lazy var flow2Label: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Trabalho: 45 Min"
        label.textColor = .black
        return label
    }()
    private lazy var circle2 = DotButtonView()
    
    private lazy var flow3Label: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Estudo: 30 Min"
        label.textColor = .black
        return label
    }()
    private lazy var circle3 = DotButtonView()
    
    private lazy var activityStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [activityLabel, flow1Label, flow2Label, flow3Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillEqually
        return stack
    }()

    
    lazy var totalLabel: DetailsLabelComponent = {
        var label = DetailsLabelComponent()
        label.boldText = "Número total:"
        label.normalText = "7 Sessões"
        return label
    }()
    
    lazy var biggerSectionLabel: DetailsLabelComponent = {
        var label = DetailsLabelComponent()
        label.boldText = "Maior Sessão Única:"
        label.normalText = "13:00-13:45 -Trabalho - 45min"
        return label
    }()
    
    lazy var bigStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [dateStack, timeLabel, activityStack, totalLabel, biggerSectionLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.layer.cornerRadius = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
        return stack
    }()
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Day Details"
        view.backgroundColor = .systemGray6
        navigationItem.leftBarButtonItem = flowButtonItem
        
        setup()
    }
    
    @objc func flowButtonTapped() {
        let flowViewController = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(flowViewController)
    }
    
}


