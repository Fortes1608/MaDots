//
//  YearHeaderCell.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 14/05/25.
//
import UIKit

class YearHeaderView: UIView {

    var toggleAction: () -> Void = {}
    private var section: Int = 0

    private lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.backgroundColor = .fillsSecondary
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0, left: 16, bottom: 8, right: 16)
        return stack
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func config(year: String, isExpanded: Bool,section: Int, action: @escaping () -> Void) {
        label.text = year
        let imageName = isExpanded ? "chevron.down" : "chevron.right"
        button.setImage(UIImage(systemName: imageName), for: .normal)
        self.toggleAction = action
        self.section = section
        
    }

    @objc private func buttonTapped() {
        toggleAction()
    }
}
extension YearHeaderView: ViewSetupProtocol {
    
    func addSubViews() {
        addSubview(stack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stack.heightAnchor.constraint(equalToConstant: 44),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

