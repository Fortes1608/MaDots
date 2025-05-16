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
    func dimension(of matrixView: MatrixView) -> Int
    func matrix(_ matrixView: MatrixView, itemFor coordinate: Coordinate) -> MatrixItem
}

protocol MatrixViewDelegate: AnyObject {
    func matrix(_ matrixView: MatrixView, didSelectItemAt coordinate: Coordinate)
}

class MatrixView: UIView {
    
    // MARK: Properties
    weak var dataSource: MatrixViewDataSource? {
        didSet {
            reloadData()
        }
    }
    
    weak var delegate: MatrixViewDelegate?
    
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

        dimension = dataSource.dimension(of: self)
        let matrix = createMatrixStackView()

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
        
        delegate?.matrix(self, didSelectItemAt: coordinate)
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
    
}

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
