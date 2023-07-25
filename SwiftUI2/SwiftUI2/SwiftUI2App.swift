//
//  SwiftUI2App.swift
//  SwiftUI2
//
//  Created by 한현민 on 2023/07/24.
//

import SwiftUI

@main
struct SwiftUI2App: App {
    // EnvironmentObject는 모든 화면에서 동일한 상태
    // EnvironmentObject는 root에서 넣어준다.
    
    // 화면 3군데 이상에서 동일하게 쓰면 EnvironmentObject를 쓰는 것이 좋고,
    // 1~2곳 쓰일 거 같으면 직접 넘기는 쪽이 프로젝트 규모가 커질 때 관리하기 유리하다.
    
    // 어떤 데이터를 EnvironmentObject로 할지, ObservedObject로 할지는 앱마다 다르다.
    // 상황에 따라 결정
    
    // ObservedObject: 구독-발행 모델에 의한 상태 관리
    
    let demoData: DemoData = DemoData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // EnvironmentObject 적용하기
                .environmentObject(demoData)
        }
    }
}
