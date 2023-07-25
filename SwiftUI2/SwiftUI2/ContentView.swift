//
//  ContentView.swift
//  SwiftUI2
//
//  Created by 한현민 on 2023/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var userName: String = ""
    @State var wifiEnabled: Bool = false
    
    var body: some View {
        Form {
            Section {
                WifiImageView(wifiEnabled: $wifiEnabled)
                
                MySubView()
            }
            VStack {
                Text("\(userName)")
                    .font(.largeTitle)
                
                // text 매개변수는 String 변수의 참조로 넘겨야 한다.
                TextField("이름 입력", text: $userName)
                    .padding()
                    .border(.gray, width: 2.0)
            }
            .padding()
        }
    }
}

struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    
    var wifiImage: String {
        wifiEnabled ? "wifi": "wifi.slash"
    }
    
    var body: some View {
        Toggle(isOn: $wifiEnabled) {
            Label("Turn on Wifi", systemImage: wifiImage)
        }
        .padding()
    }
}

struct MySubView: View {
    @EnvironmentObject var demoData: DemoData

    var body: some View {
        VStack {
            Text("\(demoData.currentUser), your number is \(demoData.userCount)")
            
            TextField("이름", text: $demoData.currentUser)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
