//
//  ViewController.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 13/05/25.
//

import UIKit

class CategorySelectViewController: UIViewController, BackButtonDelegate {
    func reloadData() {
        buttonFooter.backgroundColor = UIColor.buttonsStill
        self.collection.reloadData()
    }
    lazy var backButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.tintColor = .labelPrimary
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()

    @objc func backButtonTapped() {
        let flowViewController = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(flowViewController)
    }

    
    //MARK: MAIN TITLE LABEL
    lazy var mainTitle: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select exactly three categories"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .labelPrimary
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
        
    }()
    
        

    //MARK: FOOTER BUTTON
    lazy var buttonFooter: ButtonFooterView = {
        
        var button = ButtonFooterView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Continue"
        button.onTap = buttonAction

        return button
        
    }()
    
    //MARK: COLLECTION VIEW
    lazy var collection: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createAllLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ButtonsCollectionViewCell.self, forCellWithReuseIdentifier: ButtonsCollectionViewCell.identifier)
        collectionView.register(TextFieldCollectionViewCell.self, forCellWithReuseIdentifier: TextFieldCollectionViewCell.identifier)
        collectionView.allowsMultipleSelection = true
        collectionView.backgroundColor = .none
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
        
    }()
    
    //MARK: UPDATE BUTTON FOOTER COLLOR 
    private func updateButtonFooterState() {
        let isExactlyThreeSelected = ButtonsCollectionViewCell.howManySelected == 3

        buttonFooter.layer.cornerRadius = 20


        if isExactlyThreeSelected {
            buttonFooter.backgroundColor = UIColor.buttonsClicked
        } else {
            buttonFooter.backgroundColor = UIColor.buttonsStill
        }

        buttonFooter.backgroundColor = isExactlyThreeSelected ? UIColor.buttonsClicked : UIColor.buttonsStill


        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        view.endEditing(true)
        
    }
}

extension CategorySelectViewController: ButtonsCollectionViewCellDelegate {
    func didTapCategoryButton(in cell: ButtonsCollectionViewCell, isSelected: Bool) {
        updateButtonFooterState()
        print("teste svc")
    }
}
