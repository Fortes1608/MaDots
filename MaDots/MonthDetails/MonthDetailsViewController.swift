//
//  MonthDetailsViewController.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

class MonthDetailsViewController: UIViewController {
    
    lazy var monthDetailLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.attributedText = NSAttributedString(string: "Highlights of the month", attributes: [.font: UIFont.boldSystemFont(ofSize: 20)])
        
        return label
    }()
    
    lazy var fullFocusLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.attributedText = NSAttributedString(string: "Full Focus", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ])
        
        return label
    }()

    lazy var consistenceAndRhythmLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.attributedText = NSAttributedString(string: "Consistence And Rhythm", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ])

        
        return label
    }()
    
    lazy var timeStandardLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.attributedText = NSAttributedString(string: "time standard", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ])

        
        return label
        
        
    }()
    
    lazy var highlightMonthCollection: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: monthDetailCollectionLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.layer.cornerRadius = 12
        collectionView.backgroundColor = .fillColorSecondary
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MonthDetailsCollectionViewCell.self, forCellWithReuseIdentifier: MonthDetailsCollectionViewCell.monthIdentifier)
        
        return collectionView
        
    }()
    
    lazy var fullFocusCollection: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: monthDetailCollectionLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.layer.cornerRadius = 12
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .fillColorSecondary
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.register(MonthDetailsCollectionViewCell.self, forCellWithReuseIdentifier: MonthDetailsCollectionViewCell.monthIdentifier)
        
        return collectionView
        
        
    }()
    
    lazy var consistenceAndRhythm: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: monthDetailCollectionLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.layer.cornerRadius = 12
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .fillColorSecondary
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MonthDetailsCollectionViewCell.self, forCellWithReuseIdentifier: MonthDetailsCollectionViewCell.monthIdentifier)
        
        return collectionView
        
    }()

    lazy var timeStandard: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: monthDetailCollectionLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.layer.cornerRadius = 12
        collectionView.isScrollEnabled = false
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
        view.addSubview(monthDetailLabel)
        view.addSubview(highlightMonthCollection)
        view.addSubview(fullFocusLabel)
//        view.addSubview(fullFocusCollection)

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            monthDetailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            monthDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            highlightMonthCollection.topAnchor.constraint(equalTo: monthDetailLabel.bottomAnchor, constant: 8), 
            highlightMonthCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            highlightMonthCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            highlightMonthCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            fullFocusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fullFocusLabel.topAnchor.constraint(equalTo: highlightMonthCollection.bottomAnchor, constant: 24),
            
//            fullFocusCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            fullFocusCollection.topAnchor.constraint(equalTo: fullFocusLabel.bottomAnchor, constant: 8),
//            fullFocusCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            fullFocusCollection.heightAnchor.constraint(equalToConstant: 141),
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .background
        
    }
    
}




