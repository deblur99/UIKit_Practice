//
//  ContentView.swift
//  SwiftUI10
//
//  Created by 한현민 on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var currentIndex: Int = 0
    
    var body: some View {
        TabView(selection: $currentIndex) {
            AnimationView()
                .tabItem {
                    Image(systemName: "film.stack")
                    Text("Animation")
                }
                .tag(1)
            
            TransitionView()
                .tabItem {
                    Image(systemName: "list.and.film")
                    Text("Transition")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
