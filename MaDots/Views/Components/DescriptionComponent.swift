//
//  DescriptionComponent.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 20/05/25.
//
import UIKit

class DescriptionComponent: UIView {
    
    private lazy var boldLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Chose your Colors"
        label.textColor = .labelPrimary
        return label
    }()
    
    private lazy var normalLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.text = "Pick 3 focus categories. Assign a color to each. You decide what matters"
        label.textColor = .labelPrimary
        label.numberOfLines = 2
        return label
    }()
    
    lazy var dotImage: DotButtonView = {
        var dotButtonView = DotButtonView()
        dotButtonView.dotColor = .indigo
        dotButtonView.setContentHuggingPriority(.required, for: .horizontal)
        dotButtonView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return dotButtonView
    }()
    
    private lazy var descriptionStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [boldLabel, normalLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        return stack
    }()
    
    private lazy var bigstack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [dotImage, descriptionStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    var boldText: String? {
        didSet {
            boldLabel.text = boldText
        }
    }
    var normalText: String? {
        didSet {
            normalLabel.text = normalText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DescriptionComponent: ViewSetupProtocol {
    func addSubViews() {
        addSubview(bigstack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            dotImage.heightAnchor.constraint(equalToConstant: 30),
            dotImage.widthAnchor.constraint(equalToConstant: 30),
            bigstack.topAnchor.constraint(equalTo: self.topAnchor),
            bigstack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bigstack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bigstack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
}

