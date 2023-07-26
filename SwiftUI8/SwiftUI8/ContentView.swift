//
//  ContentView.swift
//  SwiftUI8
//
//  Created by 한현민 on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex: Int = 0
    
    @State private var foregroundColor: Color = .black
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        // TabView 아래 뷰들은 연달아 나열해서 쓰면 된다. VStack을 써서 하나의 뷰로 취급해서는 안 된다.
        TabView(selection: $selectedTabIndex) {
            // 서브뷰.tabItem { 바깥뷰 }
            NavigationStack {
                VStack {
                    Text("Hello World")
                        .font(.largeTitle)
                        .foregroundColor(foregroundColor)
                        .background(backgroundColor)
                    // contextMenu: 꾹 눌렀을 때 나오는 메뉴
                    // Text, Button이 올 수 있다.
                        .contextMenu {
                            // contextMenu 내에서도 HStack으로 따로 묶을 필요가 없다.
                            Text("텍스트")
                                .foregroundColor(.blue)
                            
                            Text("색칠하기")
                                .foregroundColor(.blue)
                            
                            Button {} label: {
                                Text("Normal Colors")
                                Image(systemName: "paintbrush")
                            }
                            
                            Button {} label: {
                                Text("Inverted Colors")
                                Image(systemName: "paintbrush.fill")
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
