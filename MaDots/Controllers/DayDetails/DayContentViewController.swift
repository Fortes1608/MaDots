//
//  MonthDetailsViewController.swift
//  MaDots
//
//  Created by Gustavo Ferreira bassani on 15/05/25.
//

import UIKit

class DayDetailViewController: UIViewController {
    
    var day: Day?
    
    init(day: Day? = nil) {
        self.day = day
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var flowButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setTitle("Flow", for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.tintColor = .labelPrimary
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(flowButtonTapped), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()
    
    lazy var toolBar: ToolBarComponent = {
        var myToolBar = ToolBarComponent()
        myToolBar.translatesAutoresizingMaskIntoConstraints = false
        return myToolBar
    }()
    
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
        
    }
    

    
    @objc func flowButtonTapped() {
        let flowViewController = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(flowViewController)
    }

}

extension DayDetailViewController: ViewSetupProtocol {
    func addSubViews() {
        
        view.addSubview(collectionView)
        view.addSubview(toolBar)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 78),
                        
                        
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .backgroundGray6
        title = "Daily Details"
        navigationItem.leftBarButtonItem = flowButtonItem
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .fillsWhite
        appearance.titleTextAttributes = [.foregroundColor: UIColor.labelPrimary]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

    }
}
