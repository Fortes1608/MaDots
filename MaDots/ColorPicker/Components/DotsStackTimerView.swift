//
//  DotsStackTimerView.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import UIKit

class DotsStackTimerView: UIView {
    
    private var dots: [DotButtonView] = []
    private let totalDots = 15
    
    init(dotColor: UIColor = UIColor.backgroundGray6) {
        super.init(frame: .zero)
        setupDots(dotColor: dotColor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDots(dotColor: .gray)
    }
    
    private func setupDots(dotColor: UIColor) {
        for _ in 0..<totalDots {
            let dot = DotButtonView()
            dot.backgroundColor = dotColor
            dot.translatesAutoresizingMaskIntoConstraints = false
            dots.append(dot)
            addSubview(dot)
        }
        
    }
}
