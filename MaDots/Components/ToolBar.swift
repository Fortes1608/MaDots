//
//  ToolBar.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit

class ToolBarComponent: UIView {
    var onMeditacaoTapped: (() -> Void)?
    var onTrabalhoTapped: (() -> Void)?
    var onEstudoTapped: (() -> Void)?

    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false

        let meditacaoButton = UIBarButtonItem(title: "Meditação", style: .done, target: self, action: #selector(meditacaoTapped))
        let trabalhoButton = UIBarButtonItem(title: "Trabalho", style: .done, target: self, action: #selector(trabalhoTapped))
        let estudoButton = UIBarButtonItem(title: "Estudo", style: .done, target: self, action: #selector(estudoTapped))

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.items = [
            flexibleSpace, meditacaoButton,
            flexibleSpace, trabalhoButton,
            flexibleSpace, estudoButton,
            flexibleSpace
        ]

        toolBar.items?.forEach { $0.tintColor = .black }

        return toolBar
    }()

    private lazy var bottomPaddingView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            return view
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: Actions
    @objc private func meditacaoTapped() {
        onMeditacaoTapped?()
    }

    @objc private func trabalhoTapped() {
        onTrabalhoTapped?()
    }

    @objc private func estudoTapped() {
        onEstudoTapped?()
    }
}

extension ToolBarComponent: ViewSetupProtocol {
    
    func addSubViews() {
        addSubview(toolBar)
        addSubview(bottomPaddingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            toolBar.topAnchor.constraint(equalTo: self.topAnchor),
            toolBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
}

