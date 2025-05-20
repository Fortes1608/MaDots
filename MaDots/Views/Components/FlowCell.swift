//
//  FlowCell.swift
//  MaDots
//
//  Created by Ana Carolina Palhares Poletto on 15/05/25.
//
import UIKit

class FlowCell: UIView {

    var toggleAction: () -> Void = {}
    private var section: Int = 0

    private lazy var dateLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.textColor = .labelSecondary
            return label
        }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tag1: UIButton = {
        let button = UIButton()
        button.setTitle("Med", for: .normal)
        button.setTitleColor(.color1, for: .normal)
        button.layer.borderColor = UIColor.color1.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.isHidden = true
        return button
    }()
    
    private lazy var tag2: UIButton = {
        let button = UIButton()
        button.setTitle("Edu", for: .normal)
        button.setTitleColor(.color1, for: .normal)
        button.layer.borderColor = UIColor.color1.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.isHidden = true
        return button
    }()
    
    private lazy var tag3: UIButton = {
        let button = UIButton()
        button.setTitle("Tra", for: .normal)
        button.setTitleColor(.color1, for: .normal)
        button.layer.borderColor = UIColor.color1.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
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
            return stack
        }()
    
    private lazy var separatorView: UIView = {
            let view = UIView()
        view.backgroundColor = .opaqueSeparator
            return view
        }()
    
    private lazy var circleStackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 12
            stack.alignment = .center
            stack.distribution = .equalSpacing
            return stack
        }()
    
    private lazy var bigStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [upStack, separatorView, circleStackView])
        stack.axis = .vertical
        stack.spacing = 16
        stack.layer.cornerRadius = 16
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        return stack
    }()
    
    private var circles: [UIView] = []

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func configTag(nameTag1: CategoriesType, nameTag2: CategoriesType, nameTag3: CategoriesType){
        tag1.setTitle(nameTag1.rawValue, for: .normal)
        tag2.setTitle(nameTag2.rawValue, for: .normal)
        tag3.setTitle(nameTag3.rawValue, for: .normal)
    }

    func config(date: String, flows: [Flow], action: @escaping () -> Void) {
        dateLabel.text = date
        toggleAction = action
    }



    @objc private func buttonTapped() {
        toggleAction()
    }
}
extension FlowCell: ViewSetupProtocol {
    
    func addSubViews() {
        addSubview(bigStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            bigStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bigStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bigStackView.topAnchor.constraint(equalTo: self.topAnchor),
            bigStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}


