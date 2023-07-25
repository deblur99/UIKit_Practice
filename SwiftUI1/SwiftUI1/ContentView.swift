//
//  ContentView.swift
//  SwiftUI1
//
//  Created by 한현민 on 2023/07/24.
//

import SwiftUI

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
    }
}

// View 프로토콜을 따르는 제너릭 타입 Content
struct MyVStack<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
        .foregroundColor(.blue)
    }
}

struct MyVStack1: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello 1")
            Text("Hello 2")
            Text("Hello 3")
        }
        .font(.largeTitle)
    }
}

struct MyVStack2: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hi 1")
            Text("Hi 2")
            Text("Hi 3")
        }
        .font(.largeTitle)
    }
}

struct ContentView: View {
    var body: some View {
        // GeometryReader: 화면 전체 사이즈 고려
        GeometryReader { geometry in
            VStack {
                Text("Hello word, how are you? lalalalalalalala")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2, height: 100)
                    .border(Color.green, width: 2.0)
                Text("Goodbye world")
                    .font(.largeTitle)
                    .frame(width: 200, height: 100)
                    .border(Color.green, width: 2.0)
            }
            .padding()
        }
//        VStack {
//            AsyncImage(url: URL(string: "https://www.hackingwithswift.com/uploads/swift-evolution-7.jpg")) { image in
//                image
//                    .resizable()
//                // .fit: 비율 고려해서 이미지 채우기
//                // .fill: 비율 상관없이 화면 전체를 이미지로 채우기
//                    .aspectRatio(contentMode: .fill)
//            } placeholder: {
//                ProgressView()
//            }
//        }
        // 화면의 safe area 제약 해제
//        .edgesIgnoringSafeArea(.all)
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            // .modifier() 메서드에 ViewModifier 프로토콜을 적용한 구조체의 인스턴스를 넣어서 프로퍼티를 일괄적으로 적용할 수 있다.
//            Text("Hello, world!")
//                .modifier(StandardTitle())
//
//            MyVStack(content: {
//                Text("Hello 1")
//                Text("Hello 2")
//                Text("Hello 3")
//            })
//            MyVStack {
//                Text("Hi 1")
//                Text("Hi 2")
//                Text("Hi 3")
//            }
//
//            Text("Helo world!")
//                .padding(.vertical, 15)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
