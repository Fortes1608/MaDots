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

    private lazy var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 36)
        button.setImage(UIImage(systemName: "pause.circle.fill", withConfiguration: config), for: .normal)
        button.tintColor = UIColor.labelPrimary
        button.addTarget(self, action: #selector(handlePlayPauseTapped), for: .touchUpInside)
        return button
    }()

    private lazy var stackTimer: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [timer, categoryButton, playPauseButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.setCustomSpacing(24, after: timer)
        stack.alignment = .center
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
            dot.backgroundColor = UIColor.fillTimer
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
            dot.backgroundColor = index < count ? activeColor : UIColor.fillTimer 
        }
    }
    
    func startCountdown() {
        timer.startCountDown()
        isTimerRunning = true
    }
    
    func advanceTime(by seconds: Int) {
        timer.advanceTime(by: seconds)
    }
    
    @objc func handlePlayPauseTapped() {
        if isTimerRunning {
            timer.pauseCountDown()
            timerDelegate?.timerDidPause()
            let config = UIImage.SymbolConfiguration(pointSize: 36)
            playPauseButton.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: config), for: .normal)
        } else {
            timer.resumeCountDown()
            timerDelegate?.timerDidResume()
            let config = UIImage.SymbolConfiguration(pointSize: 36)
            playPauseButton.setImage(UIImage(systemName: "pause.circle.fill", withConfiguration: config), for: .normal)
        }
        isTimerRunning.toggle()
    }
    
    @objc func handleCategoryButtonTapped() {
        handlePlayPauseTapped()
    }
}

extension DotsStackTimerView: ViewSetupProtocol {
    func addSubViews() {
        addSubview(stackTimer)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackTimer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackTimer.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
}

#if DEBUG
import SwiftUI

struct DotsStackTimerView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = DotsStackTimerView(category: .Work)
            return view
        }
        .frame(width: 400, height: 400)
    }
}

struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    func makeUIView(context: Context) -> UIView {
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif
