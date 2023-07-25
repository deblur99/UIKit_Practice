//
//  ContentView.swift
//  SwiftUI6
//
//  Created by 한현민 on 2023/07/25.
//

import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ContentView: View {
    @State var listData: [TodoItem] = [
        TodoItem(task: "이불 정리하기", imageName: "bed.double.fill"),
        TodoItem(task: "책상 정리", imageName: "studentdesk"),
        TodoItem(task: "아침밥 먹기", imageName: "takeoutbag.and.cup.and.straw"),
        TodoItem(task: "양치하기", imageName: "smiley.fill"),
        TodoItem(task: "줌캬기", imageName: "video"),
        TodoItem(task: "출석 QR코드", imageName: "qrcode"),
        
        TodoItem(task: "이불 정리하기", imageName: "bed.double.fill"),
        TodoItem(task: "책상 정리", imageName: "studentdesk"),
        TodoItem(task: "아침밥 먹기", imageName: "takeoutbag.and.cup.and.straw"),
        TodoItem(task: "양치하기", imageName: "smiley.fill"),
        TodoItem(task: "줌캬기", imageName: "video"),
        TodoItem(task: "출석 QR코드", imageName: "qrcode"),
        
        TodoItem(task: "이불 정리하기", imageName: "bed.double.fill"),
        TodoItem(task: "책상 정리", imageName: "studentdesk"),
        TodoItem(task: "아침밥 먹기", imageName: "takeoutbag.and.cup.and.straw"),
        TodoItem(task: "양치하기", imageName: "smiley.fill"),
        TodoItem(task: "줌캬기", imageName: "video"),
        TodoItem(task: "출석 QR코드", imageName: "qrcode"),
    ]
    
    @State var isOnAlert: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                Section("설정") {
                    Toggle(isOn: $isOnAlert) {
                        Text("알림 허용")
                    }
                    Button("로그아웃") {
                        
                    }.foregroundColor(.red)
                    Button("개인정보 수정") {
                        
                    }.foregroundColor(.blue)
                }
                
                Section("할 일") {
                    ForEach(listData) { todo in
                        HStack {
                            Image(systemName: todo.imageName)
                            Text(todo.task)
                        }
                    }
                    .onDelete(perform: deleteRows)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("얼버기~")
        }
    }
    
    func deleteRows(at offsets: IndexSet) {
        listData.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
