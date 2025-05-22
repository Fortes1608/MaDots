import UIKit

class TimerView: UIView {
    
    weak var delegate: TimerViewDelegate?
    
    private var initialTime: Int = 15
    private var timerManager: TimerManager!
    private var newFlow: Flow = .init(category: .Work, date: Date())
    private var timeLeft: Int = 15
    
    
    func configure(flow: Flow) {
            self.newFlow = flow
        }
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.textColor = .color1
        label.text = "15:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func startCountDown() {
        timeLeft = initialTime
        timerManager = TimerManager(duration: initialTime)
        timerManager.delegate = self
        timerManager.start()
    }
    func pauseCountDown() {
        timerManager.stop()
        
    }

    func resumeCountDown() {
        timerManager.start()
    }
    
    private func updateLabel(with time: Int) {
        let minutes = time / 60
        let seconds = time % 60
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}

extension TimerView: TimerManagerDelegate {
    
    func timerDidUpdate(timeLeft: Int) {
        DispatchQueue.main.async {
            self.updateLabel(with: timeLeft)
            let minutesPassed = self.initialTime - timeLeft
            self.delegate?.timerDidUpdateDots(minuteCount: minutesPassed)
        }
    }
    
    func timerDidFinish() {
        DispatchQueue.main.async {
            self.timeLabel.text = "00:00"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.delegate?.timerDidFinish()
            }
        }
        if let finishedFlow = Persistence.getTemporaryFlow() {
                Persistence.setFlow(finishedFlow)
            }

        let flowList = Persistence.getFlowList()
        print(flowList)
    }
}

extension TimerView: ViewSetupProtocol {
    func addSubViews() {
        addSubview(timeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

