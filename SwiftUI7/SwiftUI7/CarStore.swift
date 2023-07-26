//
//  CarStore.swift
//  SwiftUI7
//
//  Created by 한현민 on 2023/07/25.
//

import Foundation
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
