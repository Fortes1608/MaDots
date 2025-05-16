//
//  ViewController.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 13/05/25.
//

import UIKit

class CategorySelectViewController: UIViewController {
    
    lazy var mainTitle: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select up to three categories"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
        
    }()
    
    var titles: [String] = ["Meditation","Work","Study","Writing","Reading","Creation","Planning","Art","Exercise","Search","Organization","Design","Code"]
    
    var howManySelected: Int  = 0 {
        
        didSet {
            
            if howManySelected < 1 {
                
                //ALGUMA COISA
                
            } else if howManySelected > 3 {
                
                //OUTRA COISA
                
            }
        }
    }
    
    //MARK: FOOTER BUTTON
    lazy var buttonFooter: ButtonFooterView = {
        
        var button = ButtonFooterView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Continuar"
        
        return button
        
    }()
    
    lazy var collection: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createAllLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ButtonsCollectionViewCell.self, forCellWithReuseIdentifier: ButtonsCollectionViewCell.identifier)
        collectionView.register(TextFieldCollectionViewCell.self, forCellWithReuseIdentifier: TextFieldCollectionViewCell.identifier)
        collectionView.backgroundColor = .none
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        view.endEditing(true)

<<<<<<< HEAD
=======
extension CategorySelectViewController:ViewSetupProtocol {
    func makeConstraints() {
        
    }
    
    
    func addSubViews() {
        
        view.addSubview(mainTitle)
        view.addSubview(buttonFooter)
        
    }
    
    func setupConstraints() {
        
        
        NSLayoutConstraint.activate([
        
            mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 87),
            mainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -78),
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 78),
            
            buttonMeditation.widthAnchor.constraint(equalToConstant: 101),
            buttonWork.widthAnchor.constraint(equalToConstant: 87),
            buttonStudy.widthAnchor.constraint(equalToConstant: 74),
            
            buttonFooter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -46),
            buttonFooter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonFooter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
        ])
        
>>>>>>> leonel-pickcolorview
    }
}





