//
//  MyWebView.swift
//  WebviewNavigator
//
//  Created by 한현민 on 2023/08/03.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    var urlString: String
    var url: URL? {
        guard let url = URL(string: urlString
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            return nil
        }
        return url
    }
    
    // UI View 만들기
    func makeUIView(context: Context) -> some WKWebView {
        guard url != nil else {
            // url 생성 실패했을 때 빈 웹뷰 반환
            return WKWebView()
        }
        
        // 웹뷰 새로 생성
        let webview = WKWebView()
        webview.load(URLRequest(url: url!))
        return webview
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlString: "https://www.naver.com")
    }
}
