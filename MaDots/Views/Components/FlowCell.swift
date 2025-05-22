//
//  FlowCell.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit

class FlowCell: UITableViewCell {

    static let reuseIdentifier = "FlowCell-Identifies"

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .labelSecondary
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(
            UIImage(systemName: "chevron.right")?.withConfiguration(
                UIImage.SymbolConfiguration(weight: .bold)
            ),
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var tag1: UIButton = {
        let button = UIButton()
        button.setTitle("Texto", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.color1.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = false
        var config = UIButton.Configuration.plain()

        config.titlePadding = 8

        button.configuration = config

        button.isHidden = true
        return button
    }()

    private lazy var tag2: UIButton = {
        let button = UIButton()
        button.setTitle("Texto", for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.color1.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = false
        var config = UIButton.Configuration.plain()

        config.titlePadding = 8

        button.configuration = config
        button.isHidden = true
        return button
    }()

    private lazy var tag3: UIButton = {
        let button = UIButton()
        button.setTitle("Texto", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.color1.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = false
        var config = UIButton.Configuration.filled()

        config.titlePadding = 8

        button.configuration = config

        button.isHidden = true
        return button
    }()

    private lazy var tagStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tag1, tag2, tag3])
        stack.axis = .horizontal
        stack.spacing = 8

        return stack
    }()

    private lazy var upStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dateLabel, tagStack, button])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .opaqueSeparator
        return view
    }()

    private lazy var dot1: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()
    private lazy var dot2: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()
    private lazy var dot3: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()
    private lazy var dot4: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()
    private lazy var dot5: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()
    private lazy var dot6: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()
    private lazy var dot7: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()
    private lazy var dot8: DotButtonView = {
        var dot = DotButtonView()
        dot.dotColor = .white
        return dot
    }()

    private lazy var circleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8,
        ])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.alignment = .center

        stack.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stack
    }()

    private lazy var bigStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            upStack, separatorView, circleStackView,
        ])
        stack.axis = .vertical
        stack.spacing = 14
        stack.layer.cornerRadius = 13
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 12, left: 22, bottom: 12, right: 22)

        return stack
    }()

    func config(flows: Day) {
        guard let dicCategory = Persistence.loadCategoriesWithColor() else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "MM'.'dd"
        formatter.locale = Locale(identifier: "pt_BR")
        dateLabel.text = formatter.string(from: flows.date)

        let dots = [dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8]

        let count = min(flows.flows.count, 8)
        for i in 0..<count {
            let flow = flows.flows[i]
            let dot = dots[i]
            let key = flow.category.rawValue
            let color = dicCategory[key] ?? .systemBlue
            dot.dotColor = color
        }

        let buttons = [tag1, tag2, tag3]
        for button in buttons {
            button.isHidden = true
        }
        var categories: [CategoriesType] = []

        for flow in flows.flows {
            if !categories.contains(flow.category) {
                categories.append(flow.category)
            }
        }

        for i in 0..<categories.count {
            let button = buttons[i]
            let tagName = String(categories[i].rawValue.prefix(3))
            button.setTitle(tagName, for: .normal)
            let key = categories[i].rawValue
            let color = dicCategory[key] ?? .systemBlue
            button.tintColor = .white
            button.setTitleColor(color, for: .normal)
            button.layer.borderColor = color.cgColor
            button.isHidden = false
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .background
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonTapped() {
        let dailyViewController = UINavigationController(
            rootViewController: DayDetailViewController()
        )
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
            .changeRootViewController(dailyViewController)

    }
}
extension FlowCell: ViewSetupProtocol {

    func addSubViews() {
        contentView.addSubview(bigStackView)
    }

    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tagStack.heightAnchor.constraint(equalToConstant: 26),
       
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            bigStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            bigStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            bigStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            bigStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -8
            ),
        ])
    }

}
