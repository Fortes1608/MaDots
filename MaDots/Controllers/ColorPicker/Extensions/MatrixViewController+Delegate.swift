//
//  MatrixViewController+Delegate.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 21/05/25.
//

extension MatrixViewController: MatrixViewDelegate {
    
    func matrix(_ matrixView: MatrixView, didSelectItemAt coordinate: Coordinate) {
        let selectedColor = colors[coordinate.column]

        // A cor já foi selecionada por outra categoria?
        if let existingIndex = selection.firstIndex(of: selectedColor), existingIndex != coordinate.row {
            
            // Eu já tenho uma cor atribuída?
            if let currentColor = selection[coordinate.row] {
                // Troca as cores entre as categorias
                selection[existingIndex] = currentColor
            } else {
                // Procurar uma cor não utilizada para realocar a categoria anterior
                if let replacementColor = colors.first(where: { !selection.contains($0) && $0 != selectedColor }) {
                    selection[existingIndex] = replacementColor
                }
            }
        }
        
        // A cor está disponível ou já era minha
        selection[coordinate.row] = selectedColor
        
    }
}
