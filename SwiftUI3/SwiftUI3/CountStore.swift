//
//  CountStore.swift
//  SwiftUI3
//
//  Created by 한현민 on 2023/07/24.
//

import Foundation

class CountStore: ObservableObject {
    @Published var count: Int = 0
    
    init() {
        count = 0
    }
    
    func updateCount() {
        self.count += 1
    }
}
