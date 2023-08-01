//
//  ContentView.swift
//  SwiftUI13
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    MapView()
                        .frame(height: 400)
                        .position(.init(x: geometry.size.width / 2, y: geometry.size.height / 4))
                    
                    Image("turtlerock")
                        // 테두리 동그라미로 그리기
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .overlay(content: {
                            Circle().stroke(.gray, lineWidth: 4)
                        })
                        .frame(width: 200)
                        .position(.init(x: geometry.size.width / 2, y: geometry.size.height / 2))
                }
                .frame(height: 550)
                
                Divider()
                
                LabelView()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
