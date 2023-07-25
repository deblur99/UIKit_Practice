//
//  TimerData.swift
//  SwiftUI5
//
//  Created by 한현민 on 2023/07/25.
//

import Foundation
import Combine

class TimerData: ObservableObject {
    @Published var timeCount: Int = 0
    
    // Timer는 repeats 값이 false이면, 그 타이머의 작동이 다 된 후에 파괴되고 (fired), 스스로 nil이 된다.
    // 그래서 옵셔널로 만들어줘야 하는 것이다.
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: timeCount, repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
