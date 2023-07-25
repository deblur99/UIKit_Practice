//
//  ContentView.swift
//  SwiftUI3
//
//  Created by 한현민 on 2023/07/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countStore = CountStore()
    
    var body: some View {
        VStack {
            HStack {
                Text("\(countStore.count)")
                    .padding()
                
                Button {
                    countStore.count += 1
                } label: {
                    Text("Plus One")
                }
            }
            
            StateCountView()
            ObservedCountView(countStore: countStore)
        }
        .padding()
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
