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
    

    
    //MARK: MAIN TITLE LABEL
    lazy var mainTitle: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select up to three categories"
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
        let isAnySelected = ButtonsCollectionViewCell.howManySelected > 0

        buttonFooter.layer.cornerRadius = 20

        buttonFooter.backgroundColor = isAnySelected ? UIColor.buttonsClicked : UIColor.buttonsStill


        
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
