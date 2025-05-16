//
//  EmptyState.swift
//  LogAccount3
//
//  Created by Ana Carolina Palhares Poletto on 13/05/25.
//

import UIKit

class EmptyState: UIView {
    private func date() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM'.'dd "
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: Date())
    }

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = date()
        label.textColor = .labelSecondary
        return label
    }()
    
    lazy var separatorView: UIView = {
        var view = UIView()
        view.backgroundColor = .opaqueSeparator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Nenhum foco registrado hoje."
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel1: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "Toque em uma das categorias abaixo"
        label.textColor = .black
        return label
    }()
    private lazy var descriptionLabel2: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "para começar seu primeiro foco."
        label.textColor = .black
        return label
    }()
    private lazy var descriptiontack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [descriptionLabel1, descriptionLabel2])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var bigstack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [dateLabel, separatorView, titleLabel, descriptiontack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 16
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension EmptyState: ViewSetupProtocol {
    func addSubViews() {
        addSubview(bigstack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            bigstack.topAnchor.constraint(equalTo: self.topAnchor),
            bigstack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bigstack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bigstack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
        ])
    }
    
}
