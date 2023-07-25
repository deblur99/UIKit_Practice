//
//  ContentView.swift
//  SwiftUI4
//
//  Created by 한현민 on 2023/07/25.
//

import SwiftUI

struct PickColor: Identifiable, Hashable {
    var id: Int
    var color: Color
    var name: String
}

struct ContentView: View {
//    var colors: [Color] = [.black, .red, .green, .blue]
//    var colorNames: [String] = ["Black", "Red", "Green", "Blue"]
    
    var pickColors: [PickColor] = [
        PickColor(id: 0, color: .black, name: "검정"),
        PickColor(id: 1, color: .red, name: "빨강"),
        PickColor(id: 2, color: .green, name: "초록"),
        PickColor(id: 3, color: .blue, name: "파랑")
    ]
    
    @State private var colorIndex: Int = 0
    @State private var pickedColor: PickColor = PickColor(id: 0, color: .black, name: "검정")
    // l-value도 r-value도 타입 명시하여 사용하는 것이 좋다.
    @State private var rotation: Double = 0.0
    @State private var text: String = "Welcome to SwiftUI"
    
    @State private var date: Date = Date()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            // 위젯에 회전 효과 주기
                .rotationEffect(.degrees(rotation))
            // easeInOut: 느려졌다 빨라지는 효과
                .animation(.easeInOut(duration: 5))
                .foregroundColor(pickedColor.color)
//                .animation(.easeInOut, value: 2)
            // easeIn / Out: 느려졌다 / 빨라지는 효과 -> 가속도의 차이
//                .animation(.easeOut(duration: 5))
            
            Spacer()
            
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            TextField("[여기에 텍스트 입력]", text: $text)
                .textFieldStyle(.roundedBorder)
            
            // selection 부분의 변수에는 Picker 내 ForEach 구문 안에서 선택되는 변수의 타입과 같다면 들어갈 수 있다.
            Picker(selection: $pickedColor, label: Text("Color")) {
                ForEach(pickColors) { pickColor in
                    Text(pickColor.name).tag(pickColor.id)
                        .foregroundColor(pickColor.color)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            Text("\(rotation)")
                .font(.largeTitle)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
