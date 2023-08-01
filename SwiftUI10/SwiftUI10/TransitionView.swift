//
//  TransitionView.swift
//  SwiftUI10
//
//  Created by 한현민 on 2023/07/26.
//

import SwiftUI

struct TransitionView: View {
    @State private var isButtonVisible: Bool = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.linear(duration: 1))) {
                Text("Show/Hide Button")
            }
            .padding()
            
            // isButtonVisible가 true면 글씨의 크기가 점점 켜지며, false면 점점 작아지며 사라진다.
            if isButtonVisible {
                Button(action: {}) {
                    Text("Example Button")
                }
                .font(.largeTitle)
                .transition(.asymmetric(insertion: .scale, removal: .slide))
            }
        }
        .padding()
    }
}

extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        .opacity.combined(with: .move(edge: .top))
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
