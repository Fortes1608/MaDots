//
//  CategoriesEnum.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 13/05/25.
//


struct CategoriesType: Codable, RawRepresentable, Equatable, Hashable {
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    init?(from string: String) {
        self.init(rawValue: string)
    }
    
    static let Meditation = CategoriesType(rawValue: "Meditation")
    static let Work = CategoriesType(rawValue: "Work")
    static let Study = CategoriesType(rawValue: "Study")
    static let Writing = CategoriesType(rawValue: "Writing")
    static let Reading = CategoriesType(rawValue: "Reading")
    static let Creation = CategoriesType(rawValue: "Creation")
    static let Planning = CategoriesType(rawValue: "Planning")
    static let Art = CategoriesType(rawValue: "Art")
    static let Exercise = CategoriesType(rawValue: "Exercise")
    static let Search = CategoriesType(rawValue: "Search")
    static let Organization = CategoriesType(rawValue: "Organization")
    static let Design = CategoriesType(rawValue: "Design")
    static let Code = CategoriesType(rawValue: "Code")
    static let other = CategoriesType(rawValue: "other")
}

