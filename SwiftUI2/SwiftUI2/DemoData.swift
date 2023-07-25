//
//  DemoData.swift
//  SwiftUI2
//
//  Created by 한현민 on 2023/07/24.
//

import Foundation

// ObservableObject 프로토콜은 클래스에서 적용되어야 한다.
class DemoData: ObservableObject {
    // 객체들 간 상태값 공유 (어느 한 쪽에서 바뀌면 다른 모든 쪽에서도 바뀐다.)
    @Published var userCount: Int = 0
    @Published var currentUser: String = ""
    
    init() {
        // 변수 초기화
        updateData()
    }
    
    // @Published 프로퍼티 래퍼가 없는 변수는 객체들 간 상태값을 공유하지 않는다.
    // (각자가 값 따로 가짐)
    private var userName: String = ""
    
    func updateData() {
        // 데이터를 최신 상태로 유지
    }
}
