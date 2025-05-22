//
//  MonthDetailsViewController.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

class DayDetailViewController: UIViewController {
    
    
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.collectionCellIdentifier)
        collectionView.register(
            HeaderCollectionView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionView.reuseIdentifier
        )

        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        title = "Day Details"
        setupBackButton()
    }
    
//    func setupBackButton() {
//        let backButton = UIButton(type: .system)
//        var config = UIButton.Configuration.plain()
//        
//        config.image = UIImage(systemName: "chevron.left")
//        config.imagePadding = 4
//        config.baseForegroundColor = .labelPrimary
//        config.title = "Flow"
//
//        backButton.configuration = config
//        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
//    }
//    
//    @objc func backButtonTapped() {
//        navigationController?.popViewController(animated: true)
//    }
}

extension DayDetailViewController: ViewSetupProtocol {
    func addSubViews() {
        
        view.addSubview(collectionView)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                        
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .backgroundGray6
        
    }
}




