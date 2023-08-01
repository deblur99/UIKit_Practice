//
//  ContentView.swift
//  SwiftUI12
//
//  Created by 한현민 on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnabled: Bool = false

    var body: some View {
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0).onEnded { _ in
            self.dragEnabled = true
        }
        .sequenced(before: DragGesture())
        .updating($offset) { value, state, _ in
            switch value {
            case .first(true):
                print("Long press in progress")
            case .second(true, let drag):
                state = drag?.translation ?? .zero
            default:
                break
            }
        }
        .onEnded { _ in
            self.dragEnabled = false
        }

        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnabled ? Color.gray : Color.blue)
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
