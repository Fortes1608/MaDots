import UIKit

class TimerView: UIView {
    
    private var timerManager: TimerManager!
    private var newFlow: Flow = .init(category: .Work, color: .color1, date: Date())
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 96, weight: .bold)
        label.textColor = .color1
        label.text = "15:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        setupConstraints()
    }
    
    
    func startCountDown() {
        timerManager = TimerManager()
        timerManager.delegate = self
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
        }
    }
    
    func timerDidFinish() {
        DispatchQueue.main.async {
            self.timeLabel.text = "00:00"
        }
        
        Persistence.setFlow(newFlow)
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
                timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        }
}
