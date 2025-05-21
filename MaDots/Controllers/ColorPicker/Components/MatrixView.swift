//
//  MatrixView.swift
//  MaDots
//
//  Created by Leonel Ferraz Hernandez on 16/05/25.
//

import UIKit

typealias Coordinate = (row: Int, column: Int)

protocol MatrixItem: UIView {
    var coordinate: Coordinate? { get set }
}

protocol MatrixViewDataSource: AnyObject {
    //Quantas linhas e colunas a matriz tem
    func dimension(of matrixView: MatrixView) -> Int
    func matrix(_ matrixView: MatrixView, itemFor coordinate: Coordinate) -> MatrixItem //Retorna uma coordenada montada EU ACHO
}

protocol MatrixViewDelegate: AnyObject { //Apenas classes podem usar AnyObject
    func matrix(_ matrixView: MatrixView, didSelectItemAt coordinate: Coordinate) //Avisa qual botao foi clicado baseado na coordenada dele
}

class MatrixView: UIView {
    
    // MARK: Properties
    //Sempre que alguem redefine o dataSource, a matriz atualiza a view
    weak var dataSource: MatrixViewDataSource? {
        didSet {
            reloadData()
        }
    }
    
    weak var delegate: MatrixViewDelegate? //Esse delegate vai notificar o clique no botao
    
    var spacing: CGFloat = 0.0 {
        didSet {
            reloadData()
        }
    }
        
    private var matrixStackView = UIStackView()
    private var dimension: Int = 0
    
    // MARK: Functions
    func reloadData() {
        // Remove matriz anterior se houver
        matrixStackView.removeFromSuperview()
        drawMatrix()
    }
    
    // MARK: - Private methods
    private func drawMatrix() {
        guard let dataSource else { return }

        dimension = dataSource.dimension(of: self) //Passa a proria matriz atual, o resultado da func dimensio é salvo em dimension
        let matrix = createMatrixStackView()
        
        if dimension == 3{
            for row in 0..<dimension {
                let rowStack = createRowStackView()

                for column in 0..<dimension {
                    let coordinate = Coordinate(row, column)
                    guard let itemView = createItem(for: coordinate) else {
                        continue
                    }
                    rowStack.addArrangedSubview(itemView)
                }

                matrix.addArrangedSubview(rowStack)
            }
        }
        
        if dimension == 2{
            for row in 0..<dimension {
                let rowStack = createRowStackView()

                for column in 0..<dimension+1 {
                    let coordinate = Coordinate(row, column)
                    guard let itemView = createItem(for: coordinate) else {
                        continue
                    }
                    rowStack.addArrangedSubview(itemView)
                }

                matrix.addArrangedSubview(rowStack)
            }
        } 
        
        if dimension == 1{
            for row in 0..<dimension {
                let rowStack = createRowStackView()

                for column in 0..<dimension+2 {
                    let coordinate = Coordinate(row, column)
                    guard let itemView = createItem(for: coordinate) else {
                        continue
                    }
                    rowStack.addArrangedSubview(itemView)
                }

                matrix.addArrangedSubview(rowStack)
            }
        }

        matrixStackView = matrix
        
        // ADICIONAR À HIERARQUIA ANTES DAS CONSTRAINTS
        addSubview(matrixStackView)

        // APLICAR CONSTRAINTS
        NSLayoutConstraint.activate([
            matrixStackView.topAnchor.constraint(equalTo: self.topAnchor),
            matrixStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            matrixStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            matrixStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        if dimension == 1{
            matrixStackView.widthAnchor.constraint(equalToConstant: 160).isActive = true
            matrixStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        else if dimension == 2{
            matrixStackView.widthAnchor.constraint(equalToConstant: 170).isActive = true
            matrixStackView.heightAnchor.constraint(equalToConstant: 116).isActive = true
            
            matrixStackView.spacing = 12
        }
        else if dimension == 3{
            matrixStackView.widthAnchor.constraint(equalToConstant: 160).isActive = true
            matrixStackView.heightAnchor.constraint(equalToConstant: 180).isActive = true
            matrixStackView.spacing = 18
        }
    }
    
    private func createItem(for coordinate: Coordinate) -> MatrixItem? {
        guard let item = dataSource?.matrix(self, itemFor: coordinate) else {
            return nil
        }
        
        item.coordinate = coordinate
        item.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(itemDidTapped(_:)))
        item.addGestureRecognizer(tapGesture)
        
        return item
    }
    
    @objc private func itemDidTapped(_ sender: UITapGestureRecognizer) {
        guard
            let view = sender.view as? MatrixItem,
            let coordinate = view.coordinate
        else { return }
        
        delegate?.matrix(self, didSelectItemAt: coordinate) //Avisa o delegate que o botao foi tocado
    }
    
    private func createRowStackView() -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.spacing = spacing
        row.distribution = .fillEqually
        return row
    }
    
    private func createMatrixStackView() -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = spacing
        stack.distribution = .fillEqually
        return stack
    }
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
} //Fim da classe

extension MatrixView: ViewSetupProtocol {
    func addSubViews() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func addSubviews() {
        addSubview(matrixStackView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
