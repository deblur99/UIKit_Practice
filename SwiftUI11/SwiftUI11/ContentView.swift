//
//  ContentView.swift
//  SwiftUI11
//
//  Created by 한현민 on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var magnification: CGFloat = 1.0
    
    // 같은 제스처끼리는 하나만 적용된다!
    // 탭 1회, 탭 2회끼리는 충돌하여 1회짜리만 적용된다.
    let tap1 = TapGesture(count: 1).onEnded { _ in
        print("Tapped")
    }
    
    let tap2 = TapGesture(count: 2).onEnded { _ in
        print("Double Tapped")
    }
    
    let longPress = LongPressGesture().onEnded { _ in
        print("Long Press")
    }
    
    var body: some View {
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged({ value in
                magnification = value
            })
            .onEnded { _ in
                print("Gesture ended")
            }
        
        VStack {
//            Image(systemName: "hand.point.up.fill")
//                .font(.largeTitle)
//                .gesture(tap1)
//                .gesture(tap2) // 묻힘
//                .gesture(longPress)
            
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .font(.largeTitle)
                .scaleEffect(magnification)
                .gesture(magnificationGesture)
                .frame(width: 100, height: 90)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
