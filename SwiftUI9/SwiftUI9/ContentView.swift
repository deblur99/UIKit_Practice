//
//  ContentView.swift
//  SwiftUI9
//
//  Created by 한현민 on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation = 0.0
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            Spacer()
            
            Button { withAnimation(.linear(duration: 2)) {
                rotation = rotation < 360 ? rotation + 60 : 0
            }
            scale = scale < 2.8 ? scale + 0.3 : 1

            } label: {
                Text("Hello Rotation!")
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: rotation))
                    .animation(.linear, value: scale)
            }
            
            Spacer()
            
            Text("\(rotation)")
                .animation(.none)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
