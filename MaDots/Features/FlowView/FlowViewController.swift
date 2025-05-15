//
//  FlowViewController.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 13/05/25.
//
import UIKit

class FlowViewController: UIViewController {
    
    lazy var yearFlowButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setTitle("2025", for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.tintColor = .black
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(yearButtonTapped), for: .touchUpInside)

        return UIBarButtonItem(customView: button)
    }()
    
    
    lazy var detailsFlowButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName: "chart.line.text.clipboard"),
                               style: .plain,
                               target: self,
                               action: #selector(detailsButtonTapped))
    }()
    
    lazy var monthlyViewButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName:
        "rectangle.and.pencil.and.ellipsis"),
                               style: .plain,
                               target: self,
                               action: #selector(monthlyViewButtonTapped))
    }()

//    lazy var tableView: UITableView = {
//        var table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.dataSource = self
//        table.delegate = self
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "default-cell")
//        table.register(FlowViewCell.self, forCellReuseIdentifier: FlowViewCell.reuseIdentifier)
//        return table
//    }()
    
    lazy var emptyView: EmptyState = {
        var empty = EmptyState()
        empty.translatesAutoresizingMaskIntoConstraints = false
        return empty
    }()
    
    
    lazy var toolBar: ToolBarComponent = {
        var myToolBar = ToolBarComponent()
        myToolBar.translatesAutoresizingMaskIntoConstraints = false
        return myToolBar
    }()
//    // MARK: Properties
//    var flowList = PersistenceuserFlowList {
//        didSet {
//            buildContent()
//            tableView.reloadData()
//        }
//    }
    
//    var rows: [[Flow]] = []

    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "May"
        view.backgroundColor = .systemGray6
        navigationItem.leftBarButtonItem = yearFlowButtonItem
        navigationItem.rightBarButtonItems = [detailsFlowButtonItem, monthlyViewButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = true
        detailsFlowButtonItem.tintColor = .black
        monthlyViewButtonItem.tintColor = .black
        
        setup()
    }
    
    @objc func yearButtonTapped() {
        let yearViewController = UINavigationController(rootViewController: YearViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(yearViewController)
    }
    
    @objc func detailsButtonTapped() {
    }
    
    @objc func monthlyViewButtonTapped() {
    }
    
    @objc func flow1ToolBarTapped() {
        
    }
//    func buildRows() -> [[Flow]] {
//        var rows: [[Flow]] = []
//        
//        return rows
//    }
    
    
}
