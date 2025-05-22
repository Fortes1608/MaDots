//
//  ColorCategories.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import Foundation
import UIKit

enum ColorCategories: String, Codable {
    case color1, color2, color3
    

    var uiColor: UIColor {
            switch self {
            case .color1: return UIColor.teal
            case .color2: return UIColor.indigo
            case .color3: return UIColor.orange
            }
    }
}
