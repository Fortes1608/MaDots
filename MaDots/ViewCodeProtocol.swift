//
//  ViewCodeProtocol.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 16/05/25.
//

import Foundation

protocol ViewCodeProtocol {
    func addSubviews()
    func makeConstraints()
}

extension ViewCodeProtocol {
    func setup() {
        addSubviews()
        makeConstraints()
    }
}
