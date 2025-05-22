//
//  DotsStackView.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 18/05/25.
//

import UIKit

class DotsStackView: UIView {
    
    private lazy var dotsLabel: UILabel = {
        let label = UILabel()
        label.text = "Dots"
        label.textColor = UIColor.labelPrimary
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .opaqueSeparator
        return view
    }()
    
    private let maxDotsPerRow = 7
    private var currentRow: UIStackView?
    
    
    
    private lazy var stack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [dotsLabel, separatorView, dotButtonsStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.layer.cornerRadius = 16
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var dotButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func addDot(color: UIColor) {
        if currentRow == nil || currentRow!.arrangedSubviews.count >= maxDotsPerRow {
            let newRow = UIStackView()
            newRow.axis = .horizontal
            newRow.spacing = 8
            newRow.alignment = .center
            newRow.distribution = .equalSpacing
            newRow.translatesAutoresizingMaskIntoConstraints = false
            dotButtonsStack.addArrangedSubview(newRow)
            currentRow = newRow
        }
        
        let dot = DotButtonView()
        dot.dotColor = color
        currentRow?.addArrangedSubview(dot)
    }
    
    
}
extension DotsStackView: ViewSetupProtocol{
    func addSubViews() {
        addSubview(stack)
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 16
        self.layer.borderColor = UIColor.fillsSecondary.cgColor
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            dotButtonsStack.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 16),
            dotButtonsStack.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -16),
            dotButtonsStack.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -16),
            
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -16)
        ])
    }
    
    
}
