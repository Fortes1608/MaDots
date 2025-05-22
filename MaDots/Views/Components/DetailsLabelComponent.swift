//
//  DetailsLabelComponent.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
//
import UIKit

class DetailsLabelComponent: UIView {
    
    private lazy var boldLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.text = "Tempo Total Focado"
        label.textColor = .black
        return label
    }()
    
    private lazy var normalLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        label.text = "1h 45min"
        label.textColor = .black
        return label
    }()
    
    private lazy var bigstack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [boldLabel, normalLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
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

extension DetailsLabelComponent: ViewSetupProtocol {
    func addSubViews() {
        addSubview(bigstack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bigstack.topAnchor.constraint(equalTo: self.topAnchor),
            bigstack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bigstack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bigstack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
}

