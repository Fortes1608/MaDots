//
//  MatrixViewController+DataSource.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 21/05/25.
//

import UIKit

extension MatrixViewController: MatrixViewDataSource {
    
    //Numero de colunas
    func dimension(of matrixView: MatrixView) -> Int {
        //Define quantas linhas baseadas em quantas categorias
        return categories?.count ?? 0
    }
    
    func matrix(_ matrixView: MatrixView, itemFor coordinate: Coordinate) -> MatrixItem {
        let currentColor = colors[coordinate.column]
        let item = MatrixImageView(image: UIImage(systemName: "circle.fill"))
        
        // Cor padrão para itens não selecionados
        item.tintColor = .gray

        if let selectedColor = selection[coordinate.row] {
            // A cor dessa linha foi selecionada e corresponde à cor atual da coluna
            if selectedColor == currentColor {
                item.tintColor = currentColor
            }
        } else {
            // Essa linha ainda não selecionou nenhuma cor — mostrar a cor disponível
            item.tintColor = currentColor
        }

        return item
    }
    
}
