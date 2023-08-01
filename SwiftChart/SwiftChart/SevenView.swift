//
//  SevenView.swift
//  SwiftChart
//
//  Created by 한현민 on 2023/07/31.
//

import Charts
import SwiftUI

struct SevenView: View {
    let weekdays = Calendar.current.shortWeekdaySymbols
    let steps: [Int] = [10531, 6019, 7200, 8311, 7403, 6503, 9230]

    var body: some View {
        NavigationStack {
            Chart {
                ForEach(weekdays.indices, id: \.self) { index in
                    BarMark(x: .value("Day", weekdays[index]), y: .value("Steps", steps[index]))
                        .foregroundStyle(by: .value("Day", weekdays[index]))
                        .annotation {
                            Text("\(steps[index])")
                        }
                    
                    LineMark(x: .value("Day", "\(weekdays[index])"), y: .value("Steps", steps[index]))
                        .foregroundStyle(Color.indigo)
                        .lineStyle(StrokeStyle(lineWidth: 4.0))
                }
            }
            .navigationTitle("Weekly Report")
        }
    }
}

struct SevenView_Previews: PreviewProvider {
    static var previews: some View {
        SevenView()
    }
}
