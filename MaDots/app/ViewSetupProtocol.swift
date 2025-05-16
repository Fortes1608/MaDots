//
//  ViewCodeProtocol.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 13/05/25.
//

import Foundation

protocol ViewSetupProtocol {
    
    func addSubViews()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setup()
    func makeConstraints()
}

extension ViewSetupProtocol {
    
    func setup() {
        
        addSubViews()
        setupConstraints()
        setupAdditionalConfiguration()
        makeConstraints()
        
    }
    
    func setupAdditionalConfiguration() {}
    
}
