//
//  ContentView.swift
//  SwiftUI5
//
//  Created by 한현민 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Button {
                    resetCount()
                } label: {
                    Text("Reset Counter")
                }
                
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Next Screen")
                }
                .padding()

            }
            .padding()
        }
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimerData())
    }
}
