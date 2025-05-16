//
//  MonthlyDetailsEmptyViewController.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 14/05/25.
//

import UIKit

class MonthlyDetailsEmptyViewController: UIViewController {
    
    var emptyStateView = EmptyState()

    //        let emptystate = EmptyState()
    //        emptystate.translatesAutoresizingMaskIntoConstraints = false
    //        emptystate.titleLabel.text = "Nenhum foco registrado esse mês"
    //        emptystate.bigstack = UIStackView(arrangedSubviews: [emptystate.titleLabel, emptystate.separatorView, emptystate.titleLabel, eightDotsStack])
    //        return emptystate
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubViews()
        setupConstraints()
    }
    
    
    
    
    
}
extension MonthlyDetailsEmptyViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emptyStateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyStateView.widthAnchor.constraint(equalToConstant: 361),
            emptyStateView.heightAnchor.constraint(equalToConstant: 268)
        ])
    }
    
    
}



