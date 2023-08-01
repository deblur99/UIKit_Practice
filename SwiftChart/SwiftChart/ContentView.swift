//
//  ContentView.swift
//  SwiftChart
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            SevenView().tabItem {
                Image(systemName: "pyramid.fill")
                Text("Seven")
            }.tag(1)
            
            ToyShapeView().tabItem {
                Image(systemName: "tray")
                Text("Toys")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
