//
//  ContentView.swift
//  Localization
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI

struct ContentView: View {
    private let HelloWorld: LocalizedStringKey = "Hello"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // 로케일 적용하기
            .environment(\.locale, .init(identifier: "ko"))
    }
}
