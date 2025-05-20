//
//  Day.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 16/05/25.
//

import Foundation

struct Day: Codable {
    var flows: [Flow]
    var date: Date
}

struct Month: Codable {
    var days: [Day]
    var date: Date
}


