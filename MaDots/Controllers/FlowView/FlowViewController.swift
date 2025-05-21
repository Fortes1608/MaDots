//
//  FlowViewController.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 13/05/25.
//
import UIKit

class FlowViewController: UIViewController {
    var year = "2025"
    var month = "May"
    
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
    
    
    //MARK: Properties
    lazy var flowList = Persistence.DaysWithFlow(year: year, month: month) {
        didSet {
            rows = buildContent()
            tableView.reloadData()
        }
    }

    var rows: [Day] = []

    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setYearAndMonth()
        setNavaigationBar()
        
        self.flowList =  Persistence.DaysWithFlow(year: year, month: month)
        
        print(flowList)
        
        self.rows = buildContent()
        print("Rows:", rows)
        self.tableView.reloadData()
        tableView.allowsSelection = false

        
        setup()
    }
    func setYearAndMonth() {
        let now = Date()
            let calendar = Calendar.current

        year = String(calendar.component(.year, from: now))

        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.dateFormat = "MMMM"
        month = dateFormatter.string(from: now)
    }
    
    func setNavaigationBar() {
        title = month
        
        view.backgroundColor = .backgroundGray6

        tableView.backgroundColor = .backgroundGray6
        
        navigationItem.leftBarButtonItem = yearFlowButtonItem
        navigationItem.rightBarButtonItems = [monthlyViewButtonItem, detailsFlowButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = true
        detailsFlowButtonItem.tintColor = .black
        monthlyViewButtonItem.tintColor = .black
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
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
