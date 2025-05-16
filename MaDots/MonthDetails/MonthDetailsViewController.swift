//
//  MonthDetailsViewController.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

class MonthDetailsViewController: UIViewController {
    
    lazy var monthDetail: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.attributedText = NSAttributedString(string: "Highlights of the month", attributes: [.font: UIFont.boldSystemFont(ofSize: 20)])
        
        return label
    }()
    
    lazy var fullFocus: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.attributedText = NSAttributedString(string: "Full Focus", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ])

        
        return label
    }()

    lazy var consistenceAndRhythm: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.attributedText = NSAttributedString(string: "Consistence And Rhythm", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ])

        
        return label
    }()
    
    lazy var collection: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createAllLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.layer.cornerRadius = 12
        collectionView.backgroundColor = .fillColorSecondary
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MonthDetailsCollectionViewCell.self, forCellWithReuseIdentifier: MonthDetailsCollectionViewCell.monthIdentifier)
        
        return collectionView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

    }
}

extension MonthDetailsViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(monthDetail)
        view.addSubview(collection)
//        view.addSubview(fullFocus)
//        view.addSubview(consistenceAndRhythm)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            monthDetail.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            monthDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            
            collection.topAnchor.constraint(equalTo: monthDetail.bottomAnchor, constant: 8), 
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collection.heightAnchor.constraint(equalToConstant: 253 + 16 )
        ])

    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .background
        
    }
    
}




