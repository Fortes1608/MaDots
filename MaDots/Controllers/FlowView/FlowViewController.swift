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
        button.tintColor = .labelPrimary
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(yearButtonTapped), for: .touchUpInside)
        button.isHidden = Persistence.getFlowList().isEmpty

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
        
        self.flowList =  Persistence.DaysWithFlow(year: year, month: month)
        
        
        self.rows = buildContent()
        self.tableView.reloadData()

        
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
    
    
    @objc func yearButtonTapped() {
        let yearViewController = UINavigationController(rootViewController: YearViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(yearViewController)
    }
    
    @objc func detailsButtonTapped() {
        let alertController = UIAlertController(
            title: "Change Categories",
            message: "When editing the categories, your data will be deleted.",
            preferredStyle: .alert
        )

        let alertAction = UIAlertAction(title: "Change", style: .destructive) { _ in
            let categoryViewController = UINavigationController(rootViewController: CategorySelectViewController())
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
                .changeRootViewController(categoryViewController)
            

            Persistence.clearFlowList()
            ButtonsCollectionViewCell.howManySelected = 0
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)

        
    }
    
    
    @objc func monthlyViewButtonTapped() {
        if Persistence.DaysWithFlow(year: year, month: month).isEmpty {
            let mdeViewController = UINavigationController(rootViewController: MonthlyDetailsEmptyViewController())
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mdeViewController)
        } else{
            let mdViewController = UINavigationController(rootViewController: MonthDetailsViewController(year: self.year, month: self.month))
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mdViewController)
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let day = getFlowList(by: indexPath)
        let dailyViewController = UINavigationController(rootViewController: DayDetailViewController(day: day))
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
            .changeRootViewController(dailyViewController)
    }
}
