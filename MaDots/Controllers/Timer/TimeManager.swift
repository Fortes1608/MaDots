import Foundation

protocol TimerManagerDelegate: AnyObject {
    func timerDidUpdate(timeLeft: Int)
    func timerDidFinish()
}


class TimerManager {
    
    private var timer: Timer?
    private var timeLeft: Int = 15
    weak var delegate: TimerManagerDelegate?
    
    init(duration: Int = 15) {
        self.timeLeft = duration
    }
    
    func start() {
        guard timer == nil else { return }
        
        delegate?.timerDidUpdate(timeLeft: timeLeft)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    private func tick() {
        timeLeft -= 1
        delegate?.timerDidUpdate(timeLeft: timeLeft)
        
        if timeLeft <= 0 {
            stop()
            delegate?.timerDidFinish()
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        stop()
    }
}
