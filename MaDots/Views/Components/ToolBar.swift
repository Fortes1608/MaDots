//
//  ToolBar.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit

class ToolBarComponent: UIView {
    var timerView = TimerView()
    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        guard let listCategory =  UserDefaults.standard.value(forKey: "selectedItens") as? [String] else { return toolBar}
        
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        switch listCategory.count {
        case 1:
            let flow1Title =  listCategory[0]
            let flow1Button = UIBarButtonItem(title: flow1Title, style: .done, target: self, action: #selector(flow1Tapped))
            toolBar.items = [
                flexibleSpace, flow1Button,
                flexibleSpace
            ]
        case 2:
            let flow1Title = listCategory[0]
            let flow1Button = UIBarButtonItem(title: flow1Title, style: .done, target: self, action: #selector(flow1Tapped))
            let flow2Title = listCategory[1]
            let flow2Button = UIBarButtonItem(title: flow2Title, style: .done, target: self, action: #selector(flow2Tapped))
            toolBar.items = [
                flexibleSpace, flow1Button,
                flexibleSpace, flow2Button,
                flexibleSpace
            ]
        case 3:
            let flow1Title = listCategory[0]
            let flow1Button = UIBarButtonItem(title: flow1Title, style: .done, target: self, action: #selector(flow1Tapped))
            let flow2Title = listCategory[1]
            let flow2Button = UIBarButtonItem(title: flow2Title, style: .done, target: self, action: #selector(flow2Tapped))
            let flow3Title = listCategory[2]
            let flow3Button = UIBarButtonItem(title: flow3Title, style: .done, target: self, action: #selector(flow3Tapped))
            toolBar.items = [
                flexibleSpace, flow1Button,
                flexibleSpace, flow2Button,
                flexibleSpace, flow3Button,
                flexibleSpace
            ]
        default:
            break
        }

        
        toolBar.items?.forEach { $0.tintColor = .labelPrimary }
        
        return toolBar
    }()
    
    private lazy var bottomPaddingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .fillsWhite
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

        let flow = Flow(category: categorySelector,  date: Date())
        
        Persistence.setTemporaryFlow(flow)

        let timerVC = TimerViewController(category: categorySelector)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(timerVC)
    }

    
    // MARK: Actions
    @objc private func flow1Tapped() {
        guard let listCategory =  UserDefaults.standard.value(forKey: "selectedItens") as? [String] else { return }
        openTimerViewController(with: listCategory[0])
    }

    @objc private func flow2Tapped() {
        guard let listCategory =  UserDefaults.standard.value(forKey: "selectedItens") as? [String] else { return }
        openTimerViewController(with: listCategory[1])
    }

    @objc private func flow3Tapped() {
        guard let listCategory =  UserDefaults.standard.value(forKey: "selectedItens") as? [String] else { return }
        openTimerViewController(with: listCategory[2])
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

