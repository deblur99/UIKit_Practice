//
//  ContentView.swift
//  SwiftUI14
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI

struct ContentView:  View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
