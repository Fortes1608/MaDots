//
//  CategoriesEnum.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 13/05/25.
//


enum CategoriesType: String, Codable{
    
    case Meditation = "Meditação"
    case Work = "Trabalho"
    case Study = "Estudo"
    case writing = "Escrita"
    case reading = "Leitura"
    case creation = "Criação"
    case planning = "Planejamento"
    case art = "Art"
    case Exercise = "Exercício"
    case Search = "Pesquisa"
    case Organization = "Organização"
    case Design = "Design"
    case Code = "Code"
    case other = "Outro"
    
}
extension CategoriesType {
    init?(from string: String) {
        self.init(rawValue: string)
    }
}

