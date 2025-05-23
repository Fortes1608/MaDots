//
//  MonthlyDetailsEmptyViewController.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 14/05/25.
//

import UIKit

class MonthlyDetailsEmptyViewController: UIViewController {
    
    var year = ""
    var month = ""
    
    lazy var flowButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setTitle("Flow", for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.tintColor = .labelPrimary
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(flowButtonTapped), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()
    
    private lazy var monthlyEmptyState: MonthlyEmptyState = {
        let view = MonthlyEmptyState()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func flowButtonTapped() {
        let flowVC = FlowViewController()
        flowVC.year = self.year
        flowVC.month = self.month
        let flowViewController = UINavigationController(rootViewController: flowVC)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(flowViewController)
    }
}

extension MonthlyDetailsEmptyViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(monthlyEmptyState)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            monthlyEmptyState.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            monthlyEmptyState.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            monthlyEmptyState.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            monthlyEmptyState.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        title = "Monthly Details"
        view.backgroundColor = .backgroundGray6
        navigationItem.leftBarButtonItem = flowButtonItem
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .fillsWhite
        appearance.titleTextAttributes = [.foregroundColor: UIColor.labelPrimary]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
