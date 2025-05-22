//
//  MonthlyDetailsEmptyViewController.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 14/05/25.
//

import UIKit

class MonthlyDetailsEmptyViewController: UIViewController {
    
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
    
    var emptyStateView = EmptyState()
    
    lazy var toolBar: ToolBarComponent = {
        var myToolBar = ToolBarComponent()
        myToolBar.translatesAutoresizingMaskIntoConstraints = false
        return myToolBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstraints()
    }
    
    @objc func flowButtonTapped() {
        let flowViewController = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(flowViewController)
    }
    
    
    
    
    
}
extension MonthlyDetailsEmptyViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolBar)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emptyStateView.topAnchor.constraint(equalTo: view.topAnchor, constant: 114),
            emptyStateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateView.widthAnchor.constraint(equalToConstant: 361),
            emptyStateView.heightAnchor.constraint(equalToConstant: 268),
            
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 78),

        ])
    }
    func setupAdditionalConfiguration() {
        title = "Monthly Details"
        view.backgroundColor = .backgroundGray6
        view.backgroundColor = .backgroundGray6
        navigationItem.leftBarButtonItem = flowButtonItem
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
}



