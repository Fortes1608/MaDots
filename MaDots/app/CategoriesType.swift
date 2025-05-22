//
//  CategoriesEnum.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 13/05/25.
//


enum CategoriesType: String, Codable{
    
    case Meditation = "Meditation"
    case Work = "Work"
    case Study = "Study"
    case Writing = "Writing"
    case Reading = "Reading"
    case Creation = "Creation"
    case Planning = "Planning"
    case Art = "Art"
    case Exercise = "Exercise"
    case Search = "Search"
    case Organization = "Organization"
    case Design = "Design"
    case Code = "Code"
    case other = "other"
    
}
extension CategoriesType {
    init?(from string: String) {
        self.init(rawValue: string)
    }
}

