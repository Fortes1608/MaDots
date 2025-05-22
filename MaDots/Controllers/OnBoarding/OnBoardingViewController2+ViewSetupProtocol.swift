//
//  OnBoardingViewController2+ViewSetupProtocol.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 20/05/25.
//

import UIKit
extension OnBoardingViewController2: ViewSetupProtocol{
    func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(bigStack)

        view.addSubview(getStartedButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 102),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
    
            
            bigStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 295),
            bigStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bigStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

    
            getStartedButton.heightAnchor.constraint(equalToConstant: 50),
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36),
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBackground
    }
}
