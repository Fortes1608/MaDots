import UIKit

class TimerView: UIView {
    
    weak var delegate: TimerViewDelegate?
    
    private var initialTime: Int = 900 //TESTE: mude para 15 (segundos) para testar o fim do timer mais rápido
    private var timerManager: TimerManager!
    private var newFlow: Flow = .init(category: .Work, date: Date())
    private var timeLeft: Int = 900 //TESTE: deve ser o mesmo valor do initialTime acima
    
    
    func configure(flow: Flow) {
            self.newFlow = flow
        }
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.textColor = .teal
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
    
    func advanceTime(by seconds: Int) {
        timerManager?.advanceTime(by: seconds)
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
            let minutesPassed = (self.initialTime - timeLeft) / 60 //TESTE: tire o / 60 para testar o timer rápido
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

