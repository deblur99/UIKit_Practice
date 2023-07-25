//
//  SecondVoew.swift
//  SwiftUI5
//
//  Created by 한현민 on 2023/07/25.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
        }
        .padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(TimerData())
    }
}
