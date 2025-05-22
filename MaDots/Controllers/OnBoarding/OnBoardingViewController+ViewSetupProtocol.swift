//
//  OnBoardingViewController+ViewSetupProtocol.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 20/05/25.
//

import UIKit
extension OnBoardingViewController: ViewSetupProtocol{
    func addSubViews() {
        view.addSubview(trackLabel)
        view.addSubview(descriptionStack)
        view.addSubview(iphoneImageView)
        view.addSubview(continueButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            trackLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 83),
            trackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            trackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -71),
            
            descriptionStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 201),
            descriptionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            descriptionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -71),
            
            iphoneImageView.topAnchor.constraint(equalTo: descriptionStack.bottomAnchor, constant: 16),
            iphoneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBackground
    }
}
