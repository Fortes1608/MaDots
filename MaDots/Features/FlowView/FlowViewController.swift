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
    
    
    lazy var monthlyViewButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName: "chart.line.text.clipboard"),
                               style: .plain,
                               target: self,
                               action: #selector(monthlyViewButtonTapped))
    }()
    
    lazy var detailsFlowButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName:
        "rectangle.and.pencil.and.ellipsis"),
                               style: .plain,
                               target: self,
                               action: #selector(detailsButtonTapped))
    }()

    lazy var tableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "default-cell")
        table.register(FlowCell.self, forCellReuseIdentifier: FlowCell.reuseIdentifier)
        return table
    }()
    
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
    
    
    // MARK: Properties
//    var flowList = Persistence.getFlowList() {
//        didSet {
//            rows = buildContent()
//            tableView.reloadData()
//        }
//    }
    
    var flowList: [Day] = [
        Day(
            days: [
                Flow(category: .Work, color: .color1, date: Date()),
                Flow(category: .Work, color: .color1, date: Date()),
                Flow(category: .Work, color: .color1, date: Date()),
                Flow(category: .Work, color: .color1, date: Date())
            ],
            date: Date()
        ),
        Day(
            days: [
                Flow(category: .Code, color: .color1, date: Date()),
                Flow(category: .Exercise, color: .color2, date: Date()),
                Flow(category: .Meditation, color: .color3, date: Date()),
                Flow(category: .Code, color: .color1, date: Date())
            ],
            date: Date()
        )
    ]


    var rows: [Day] = []

    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "May"
        view.backgroundColor = .white
        tableView.backgroundColor = .background
        navigationItem.leftBarButtonItem = yearFlowButtonItem
        navigationItem.rightBarButtonItems = [monthlyViewButtonItem, detailsFlowButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = true
        detailsFlowButtonItem.tintColor = .black
        monthlyViewButtonItem.tintColor = .black
        
        
//        self.flowList = Persistence.getFlowList()
        
        self.flowList = [Day(
            days: [
                Flow(category: .Work, color: .color1, date: Date()),
                Flow(category: .Work, color: .color1, date: Date()),
                Flow(category: .Work, color: .color1, date: Date()),
                Flow(category: .Work, color: .color1, date: Date())
            ],
            date: Date()
        ),
        Day(
            days: [
                Flow(category: .Code, color: .color1, date: Date()),
                Flow(category: .Exercise, color: .color2, date: Date()),
                Flow(category: .Meditation, color: .color3, date: Date()),
                Flow(category: .Code, color: .color1, date: Date()),
                Flow(category: .Code, color: .color1, date: Date()),
                Flow(category: .Exercise, color: .color2, date: Date()),
                Flow(category: .Meditation, color: .color3, date: Date()),
                Flow(category: .Code, color: .color1, date: Date()),
                Flow(category: .Code, color: .color1, date: Date())
            ],
            date: Date()
        )
    ]
        
        self.rows = buildContent()
        print("Rows:", rows)
        self.tableView.reloadData()
        tableView.allowsSelection = false

        
        setup()
    }
    
    @objc func yearButtonTapped() {
        let yearViewController = UINavigationController(rootViewController: YearViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(yearViewController)
    }
    
    @objc func detailsButtonTapped() {
        
        
    }
    
    
    @objc func monthlyViewButtonTapped() {
        let mdeViewController = UINavigationController(rootViewController: MonthlyDetailsEmptyViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mdeViewController)
    }

    func buildContent() -> [Day] {
//        guard let flowList = flowList else { return [] }
//            return [flowList]
        return flowList
    }

    
    func getFlowList(by indexPath: IndexPath) -> Day{
        return rows[indexPath.section]
    }
    
}

extension FlowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
}
