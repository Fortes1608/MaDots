import UIKit


protocol TimerViewDelegate: AnyObject {
    func timerDidUpdateDots(minuteCount: Int)
    func timerDidFinish()
}

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
    
    lazy var buttonBack: UIButton = {
        var button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonSairTapped), for: .touchUpInside)
        return button
    }()
    
    private var dotTimer: Timer?
    private var elapsedTime = 0
    private let interval = 15
    
    private lazy var fullStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [dotStack, dotsStackView ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()
    
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
        dotStack.updateDots(count: minuteCount, activeColor: .color1)
    }
    
    func timerDidFinish() {
            dotStack.startCountdown()
            self.elapsedTime = 0
        }
}
