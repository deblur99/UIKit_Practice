//
//  SwiftUI5App.swift
//  SwiftUI5
//
//  Created by 한현민 on 2023/07/25.
//

import SwiftUI

@main
struct SwiftUI5App: App {
    // 실행되는 동안 객체가 메모리에 계속 남아 있으므로 화면 대부분에서 계속 쓰이는 상황에만 EnvironmentObject를 쓰는 것을 추천한다.
    let timerData: TimerData = TimerData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerData)
        }
    }
}
