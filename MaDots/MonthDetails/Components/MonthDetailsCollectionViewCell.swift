//
//  MonthDetailsCollectionViewCell.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 16/05/25.
//

import UIKit

class MonthDetailsCollectionViewCell: UICollectionViewCell {
    
    static let monthIdentifier = "monthDetail-identifies"
    
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
        label.attributedText = NSAttributedString(string: "", attributes: [ .font: UIFont.systemFont(ofSize: 20, weight: .semibold)])
        
        return label
        
    }()
    
    lazy var circleImage: UIImageView = {
       
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var stackWithImage: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [circleImage,lowerLabel])
        
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

extension MonthDetailsCollectionViewCell: ViewSetupProtocol {
    func addSubViews() {
        
        addSubview(upperLabel)
        addSubview(separatorLine)
        addSubview(stackWithImage)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            upperLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            upperLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            upperLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        
            stackWithImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackWithImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackWithImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        
            separatorLine.topAnchor.constraint(equalTo: upperLabel.bottomAnchor, constant: 8),
            separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
    }
    
    
}
