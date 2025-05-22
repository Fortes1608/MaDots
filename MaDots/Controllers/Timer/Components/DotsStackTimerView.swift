import UIKit

class DotsStackTimerView: UIView {
    var category: CategoriesType
    lazy var timer = TimerView()
    var isTimerRunning = false
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(category.rawValue, for: .normal)
        button.setTitleColor(UIColor.labelPrimary, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(handleCategoryButtonTapped), for: .touchUpInside)
        return button
    }()

    
    private lazy var stackTimer: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [timer, categoryButton])
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

    init(category: CategoriesType) {
        self.category = category
        super.init(frame: .zero)
        self.setupDots()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            let angle = angleIncrement * CGFloat(index) - .pi / 2
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
        isTimerRunning = true
    }
    
    
    @objc func handleCategoryButtonTapped() {
           if isTimerRunning {
               timer.pauseCountDown()
               
           } else {
               timer.resumeCountDown()
           }
           isTimerRunning.toggle()
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
