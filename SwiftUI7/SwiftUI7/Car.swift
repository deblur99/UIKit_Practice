//
//  Car.swift
//  SwiftUI7
//
//  Created by 한현민 on 2023/07/25.
//

import Foundation

struct Car: Identifiable, Codable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}
