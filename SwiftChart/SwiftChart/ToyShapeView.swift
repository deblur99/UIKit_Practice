//
//  ContentView.swift
//  SwiftChart
//
//  Created by 한현민 on 2023/07/31.
//

import Charts // Chart를 사용하려면 별도의 라이브러리를 import 해야 한다.
import SwiftUI

struct ToyShape: Identifiable {
    var id = UUID()
    var color: String
    var type: String
    var count: Int
}

let data: [ToyShape] = [
    ToyShape(color: "Green", type: "Cube", count: 2),
    ToyShape(color: "Green", type: "Sphere", count: 0),
    ToyShape(color: "Green", type: "Pyramid", count: 1),
    ToyShape(color: "Purple", type: "Cube", count: 1),
    ToyShape(color: "Purple", type: "Sphere", count: 1),
    ToyShape(color: "Purple", type: "Pyramid", count: 1),
    ToyShape(color: "Pink", type: "Cube", count: 1),
    ToyShape(color: "Pink", type: "Sphere", count: 2),
    ToyShape(color: "Pink", type: "Pyramid", count: 0),
    ToyShape(color: "Yellow", type: "Cube", count: 1),
    ToyShape(color: "Yellow", type: "Sphere", count: 1),
    ToyShape(color: "Yellow", type: "Pyramid", count: 2),
]

struct ToyShapeView: View {
    var body: some View {
        Chart {
            ForEach(data) { datum in
                BarMark(x: .value("Shape Type", datum.type), y: .value("Count", datum.count))
                    .foregroundStyle(by: .value("Shape Color", datum.color))
            }
        }
        .chartForegroundStyleScale([
            "Green": .green,
            "Purple": .purple,
            "Pink": .pink,
            "Yellow": .yellow
        ])
        .padding()
    }
}

struct ToyShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ToyShapeView()
    }
}
