import UIKit
import AudioToolbox

protocol TimerViewDelegate: AnyObject {
    func timerDidUpdateDots(minuteCount: Int)
    func timerDidFinish()
}

class TimerViewController: UIViewController {
    private let category: CategoriesType
    
    init(category: CategoriesType) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    private lazy var dotStack: DotsStackTimerView = {
        let view = DotsStackTimerView(category: category)
        guard let dicColor = Persistence.loadCategoriesWithColor() else { return view }
        view.timer.timeLabel.textColor = dicColor[category.rawValue]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dotsStackView: DotsStackView = {
        let view = DotsStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var buttonBack: UIButton = {
        var button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonSairTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var fullStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [dotStack, dotsStackView ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .fillsWhite
        setup()
        dotStack.timerDelegate = self
        dotStack.startCountdown()
    }
    
    @objc func buttonSairTapped() {
        let flowVC = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
            .changeRootViewController(flowVC)
    }

    deinit {
        // ...
    }
    
}

extension TimerViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(dotStack)
        view.addSubview(dotsStackView)
        view.addSubview(fullStack)
        view.addSubview(buttonBack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            fullStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 117.74), fullStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), fullStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), fullStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 498.16),
            
            dotStack.topAnchor.constraint(equalTo: fullStack.topAnchor),
            dotStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dotStack.heightAnchor.constraint(equalToConstant: 311.16),
            dotStack.widthAnchor.constraint(equalToConstant: 312.87),
            dotStack.leadingAnchor.constraint(equalTo: fullStack.leadingAnchor, constant: 24.07),
            dotStack.trailingAnchor.constraint(equalTo: fullStack.trailingAnchor, constant: -24.07),
            
            buttonBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            buttonBack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 309),
            
            dotsStackView.topAnchor.constraint(equalTo: dotStack.bottomAnchor, constant: 40), dotsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), dotsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), dotsStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 147)
        ])
    }
}

extension TimerViewController: TimerViewDelegate {
    func timerDidUpdateDots(minuteCount: Int) {
        guard let dicColor = Persistence.loadCategoriesWithColor() else { return }
        dotStack.updateDots(count: minuteCount / 60, activeColor: dicColor[category.rawValue] ?? .systemBlue)
    }
    
    func timerDidFinish() {
            // Reset all 15 circular dots to inactive
            dotStack.updateDots(count: 0, activeColor: .clear)
            dotStack.startCountdown()
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            
            if let dicColor = Persistence.loadCategoriesWithColor() {
                dotsStackView.addDot(color: dicColor[category.rawValue] ?? .systemBlue)
            }
        }
}
