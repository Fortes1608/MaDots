
import UIKit

class TimerViewController: UIViewController {

    private let timer: TimerView = {
        var timer = TimerView()
        timer.translatesAutoresizingMaskIntoConstraints = false
        timer.tintColor = .color1
        return timer
    }()
    
    private let categoryLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.labelPrimary
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.text = "Categoria1"
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let buttonDescanso: ButtonFooterView = {
        var button = ButtonFooterView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Descanso"
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor.labelSecondary
        return button
    }()
    
    private let buttonSair: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("sair", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setupConstraints()
        }

}

extension TimerViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(timer)
        view.addSubview(buttonDescanso)
        view.addSubview(categoryLabel)
        view.addSubview(buttonSair)
        timer.startCountDown()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            timer.topAnchor.constraint(equalTo: view.topAnchor, constant: 334),
            timer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            timer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            timer.heightAnchor.constraint(equalToConstant: 95),
            
            buttonDescanso.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30), buttonDescanso.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), buttonDescanso.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            categoryLabel.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 18), categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonSair.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            buttonSair.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 309), buttonSair.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
}
