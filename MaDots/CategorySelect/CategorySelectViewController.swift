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
        collectionView.backgroundColor = .none
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        view.endEditing(true)

    }
}





