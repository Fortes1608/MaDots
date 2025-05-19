import UIKit

class TimerViewController: UIViewController {
    
    private lazy var dotStack: DotsStackTimerView = {
        let view = DotsStackTimerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dotsStackView: DotsStackView = {
        let view = DotsStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonSair: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("sair", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(buttonSairTapped), for: .touchUpInside)
        return button
    }()
    
    private var dotTimer: Timer?
    private var elapsedTime = 0
    private let interval = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        dotStack.timerDelegate = self
        dotStack.startCountdown()
        startRepeatingDotTimer()
    }
    
    @objc func buttonSairTapped() {
        let flowVC = UINavigationController(rootViewController: FlowViewController())
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
            .changeRootViewController(flowVC)
    }

    deinit {
            dotTimer?.invalidate()
        }
    
    private func startRepeatingDotTimer() {
         dotTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
             guard let self = self else { return }
             self.elapsedTime += 1
             
             if self.elapsedTime == self.interval {
                 self.elapsedTime = 0
                 self.dotsStackView.addDot(color: .color1) 
             }
         }
     }
}



extension TimerViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(dotStack)
        view.addSubview(buttonSair)
        view.addSubview(dotsStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            dotStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 176),
            dotStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dotStack.heightAnchor.constraint(equalToConstant: 311.16),
            dotStack.widthAnchor.constraint(equalToConstant: 311.16),
            
            buttonSair.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            buttonSair.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            dotsStackView.topAnchor.constraint(equalTo: dotStack.bottomAnchor, constant: 40), dotsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), dotsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), dotsStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 147)
        ])
    }
}

extension TimerViewController: TimerViewDelegate {
    func timerDidUpdateDots(minuteCount: Int) {
        dotStack.updateDots(count: minuteCount, activeColor: .color1)
    }
    
    func timerDidFinish() {
            dotStack.startCountdown()
            self.elapsedTime = 0
        }
}
