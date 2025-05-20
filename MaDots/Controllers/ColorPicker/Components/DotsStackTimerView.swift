import UIKit

class DotsStackTimerView: UIView {
    
    private lazy var timer = TimerView()
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.labelPrimary
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        label.text = "Categoria1"
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    private lazy var stackTimer: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [timer,categoryLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    private var dots: [DotButtonView] = []
    private let totalDots = 15
    
    
    var timerDelegate: TimerViewDelegate? {
        get { timer.delegate }
        set { timer.delegate = newValue }
        
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDots()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDots()
        setup()
    }
    
    private func setupDots() {
        for _ in 0..<totalDots {
            let dot = DotButtonView()
            dot.backgroundColor = UIColor.tertiarySystemBackground
            dots.append(dot)
            addSubview(dot)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = 155.58
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let angleIncrement = 2 * CGFloat.pi / CGFloat(totalDots)
        
        for (index, dot) in dots.enumerated() {
            let angle = angleIncrement * CGFloat(index)
            let x = center.x + radius * cos(angle)
            let y = center.y + radius * sin(angle)
            let dotSize: CGFloat = 31.13
            dot.frame = CGRect(x: x - dotSize / 2, y: y - dotSize / 2, width: dotSize, height: dotSize)

        }
    }
    
    func updateDots(count: Int, activeColor: UIColor) {
        for (index, dot) in dots.enumerated() {
            dot.backgroundColor = index < count ? activeColor : UIColor.gray
        }
    }
    
    func startCountdown() {
        timer.startCountDown()
    }
}

extension DotsStackTimerView: ViewSetupProtocol {
    func addSubViews() {
        addSubview(stackTimer)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackTimer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 89), stackTimer.topAnchor.constraint(equalTo: self.topAnchor, constant: 119), stackTimer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -89), stackTimer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -119)
        ])
    }
    
    
}
