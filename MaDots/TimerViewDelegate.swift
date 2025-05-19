//
//  TimerViewDelegate.swift
//  MaDots
//
//  Created by Lorenzo Fortes on 18/05/25.
//

import Foundation

protocol TimerViewDelegate: AnyObject {
    func timerDidUpdateDots(minuteCount: Int)
    func timerDidFinish()
}
