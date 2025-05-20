//
//  ToolBar.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit

class ToolBarComponent: UIView {
    
    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        let flow1Button = UIBarButtonItem(title: "Meditação", style: .done, target: self, action: #selector(flow1Tapped))
        let flow2Button = UIBarButtonItem(title: "Trabalho", style: .done, target: self, action: #selector(flow2Tapped))
        let flow3Button = UIBarButtonItem(title: "Estudo", style: .done, target: self, action: #selector(flow3Tapped))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.items = [
            flexibleSpace, flow1Button,
            flexibleSpace, flow2Button,
            flexibleSpace, flow3Button,
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
    
    private func openTimerViewController(with category: String) {
        guard let categorySelector = CategoriesType(from: category) else { return }

        let flow = Flow(category: categorySelector, color: .color2, date: Date())
        
        Persistence.setTemporaryFlow(flow)

        let timerVC = TimerViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(timerVC)
    }

    
    // MARK: Actions
    @objc private func flow1Tapped() {
        openTimerViewController(with: "Meditação")
    }

    @objc private func flow2Tapped() {
        openTimerViewController(with: "Trabalho")
    }

    @objc private func flow3Tapped() {
        openTimerViewController(with: "Estudo")
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
            toolBar.bottomAnchor.constraint(equalTo: bottomPaddingView.topAnchor),
            
        ])
        
    }
}

