import UIKit

class TimerView: UIView {

    private var timer : Timer?
    private var timeLeft: Int = 900
    
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
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
            timeLeft -= 1
            updateLabel()

            if timeLeft <= 0 {
                timer?.invalidate()
                timer = nil
                timeLabel.text = "00:00"
            }
        }
    
  private func updateLabel() {
           let minutes = timeLeft / 60
           let seconds = timeLeft % 60
           timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
       }
}

extension TimerView: ViewSetupProtocol{
    func addSubViews() {
        addSubview(timeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
}
