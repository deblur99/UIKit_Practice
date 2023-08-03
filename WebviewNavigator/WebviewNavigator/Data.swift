//
//  Data.swift
//  WebviewNavigator
//
//  Created by 한현민 on 2023/08/03.
//

import Foundation

struct MyURL: Identifiable {
    var id = UUID()
    var name: String
    var urlString: String
}

extension MyURL {
    static let sampleData: [MyURL] = [
        MyURL(name: "NAVER", urlString: "https://www.naver.com"),
        MyURL(name: "YouTube", urlString: "https://www.youtube.com"),
        MyURL(name: "Google", urlString: "https://www.google.com")
    ]
}

class MyURLModel: ObservableObject {
    @Published var myURLs: [MyURL] = MyURL.sampleData
    
    // myURLs에 없는 요소를 저장
    func addItem(myURL: MyURL) -> Bool {
        // Index? -> nil
        
        // 중복되는 값이 들어올 때
        // 이미 들어가 있는 요소인지 파악한다.
        
        // 근데 이제 여기서 이미 있는 거라면, 이미 있는 요소에 대한 인덱스가 _에 저장된다.
        // 그리고, 찾지 못한 요소는 else문이 실행되어 false 값을 반환한다.
        guard myURLs.contains(where: {
            myURL.name == $0.name || myURL.urlString == $0.urlString
        }) else {
            myURLs.append(myURL)
            return true
        }
        
        // 중복된 값이 있으므로 실패했음을 의미하는 false 반환
        return false
    }
    
    func removeItem(at offsets: IndexSet) {
        myURLs.remove(atOffsets: offsets)
    }
}
