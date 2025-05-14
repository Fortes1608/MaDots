
import UIKit

class TimerViewController: UIViewController {

    private let timer: TimerView = {
        var timer = TimerView()
        timer.translatesAutoresizingMaskIntoConstraints = false
        timer.tintColor = .color1
        return timer
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
        timer.startCountDown()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            timer.topAnchor.constraint(equalTo: view.topAnchor, constant: 334),
            timer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            timer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            timer.heightAnchor.constraint(equalToConstant: 95)
        ])
    }
    
}
