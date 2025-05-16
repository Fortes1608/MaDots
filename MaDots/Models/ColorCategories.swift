//
//  ColorCategories.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import Foundation
import UIKit

enum ColorCategories: String, Codable {
    case color1
    case color2
    case color3

    var uiColor: UIColor {
        switch self {
        case .color1: return UIColor.color1
        case .color2: return UIColor.color2
        case .color3: return UIColor.color3
        }
    }
}
