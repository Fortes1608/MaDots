//
//  MonthDetailsCollectionViewCell.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let collectionCellIdentifier = "collectionViewCell-identifies"
    
    lazy var upperLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.attributedText = NSAttributedString(string: "", attributes: [ .font: UIFont.systemFont(ofSize: 20, weight: .regular)])
        
        return label
        
    }()
    
    lazy var separatorLine: UIView = {
       
        let separator = UIView()
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            
        return separator
    
    }()
    
    lazy var lowerLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .labelPrimary
        label.attributedText = NSAttributedString(string: "", attributes: [ .font: UIFont.systemFont(ofSize: 28, weight: .bold)])
        
        return label
        
    }()
    
    lazy var circleImage: UIImageView = {
       
        let image = UIImageView()

        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var stackWithImage: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [lowerLabel])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    func configureCell(upperLabel: String, lowerLabel:String, image: UIImage? ) {
        
        self.upperLabel.text = upperLabel
        self.lowerLabel.text = lowerLabel
        if let image {
            self.circleImage.image = image
        }
        
    }
    
    
    //MARK: INITS
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
    
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
}

extension CollectionViewCell: ViewSetupProtocol {
    func addSubViews() {
        
        addSubview(upperLabel)
        addSubview(separatorLine)
        addSubview(stackWithImage)
        addSubview(circleImage)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            upperLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            upperLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            upperLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        
            stackWithImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackWithImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackWithImage.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 8),
            
            circleImage.topAnchor.constraint(equalTo: separatorLine.topAnchor, constant: 8),
            circleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circleImage.heightAnchor.constraint(equalToConstant: 30),
            circleImage.widthAnchor.constraint(equalToConstant: 30),
            
            separatorLine.topAnchor.constraint(equalTo: upperLabel.bottomAnchor, constant: 8),
            separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        self.backgroundColor = .fillTimer
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
    }
    
    
}
