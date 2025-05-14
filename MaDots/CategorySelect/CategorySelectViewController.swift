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
        label.text = "Selecione até três categorias"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
        
    }()
    
    lazy var buttonMeditation: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Meditation.rawValue
        
        return button
        
    }()

    lazy var buttonWork: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Work.rawValue
        
        return button
        
    }()

    lazy var buttonStudy: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Study.rawValue
        
        return button
        
    }()
    
    lazy var buttonWriting: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.writing.rawValue
        
        return button
        
    }()

    lazy var buttonReading: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.reading.rawValue
        
        return button
        
    }()
    
    lazy var buttonCreation: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.creation.rawValue
        
        return button
        
    }()

    lazy var buttonPlanning: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.planning.rawValue
        
        return button
        
    }()

    lazy var buttonArt: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.art.rawValue
        
        return button
        
    }()
    
    lazy var buttonExercise: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Exercise.rawValue
        
        return button
        
    }()
    
    lazy var buttonSearch: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Search.rawValue
        
        return button
        
    }()

    lazy var buttonOrganization: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Organization.rawValue
        
        return button
        
    }()
    
    lazy var buttonDesign: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Design.rawValue
        
        return button
        
    }()

    lazy var buttonCode: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.Code.rawValue
        
        return button
        
    }()

    lazy var buttonOther: ButtonCategoryView = {
       
        let button = ButtonCategoryView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = CategoriesType.other.rawValue
        
        return button
        
    }()
    
    //MARK: FOOTER BUTTON
    lazy var buttonFooter: ButtonFooterView = {
        
       var button = ButtonFooterView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Continuar"
        
        return button
        
    }()
    
//    lazy var colletcionView: UICollectionView = {
//        
//        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .none
//        collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
//        
//        return collectionView
//        
//    }()
        
    var howManySelected: Int  = 0 {
        
        didSet {
            
            if howManySelected < 1 {
                
                
                
            } else if howManySelected > 3 {
                
                
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        
        
    }
    
    
}

extension CategorySelectViewController:ViewSetupProtocol {
    
    func addSubViews() {
        
        view.addSubview(mainTitle)
        view.addSubview(buttonFooter)
        view.addSubview(buttonWork)
        view.addSubview(buttonArt)
        view.addSubview(buttonCode)
        view.addSubview(buttonStudy)
        
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
            
            buttonWork.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20),
            buttonWork.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buttonArt.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 80),
            buttonArt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buttonCode.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 140),
            buttonCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            buttonStudy.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 200),
            buttonStudy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .background
        
        

    }
    
    
}



