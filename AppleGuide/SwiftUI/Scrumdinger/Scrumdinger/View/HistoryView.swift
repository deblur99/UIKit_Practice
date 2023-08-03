//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/02.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        HStack {
            Image(systemName: "calendar")
            Text(history.date, style: .date)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(history: DailyScrum.sampleData[0].history[0])
    }
}
