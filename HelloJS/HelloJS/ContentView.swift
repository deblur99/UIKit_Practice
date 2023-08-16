//
//  ContentView.swift
//  HelloJS
//
//  Created by 한현민 on 2023/08/16.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State var webView: WKWebView = .init()
    @State var text: String = ""
    
    var body: some View {
        VStack {
            ProfileView(webView: $webView)
            Button("Update title") {
//                manipulateWebView()
//                getTitleWebView()
                updateTitleWebView()
            }
            Text(text)
        }
    }
    
    func manipulateWebView() {
        let script = "document.getElementsByTagName('h1')[0].innerText = 'Hello Ned!';"
        webView.evaluateJavaScript(script) { result, error in
            
        }
    }
    
    func getTitleWebView() {
        let script = "document.getElementsByTagName('h1')[0].innerText"
        
        webView.evaluateJavaScript(script) { result, error in
            if let error {
            } else {
                if let stringValue = result as? String {
                    text = stringValue
                }
                debugPrint("\(text)")
            }
        }
    }
    
    func updateTitleWebView() {
        let script = """
            var title = 'Hello NED!!';
            document.getElementsByTagName('h1')[0].innerText = title;
        """
        
        webView.evaluateJavaScript(script) { result, error in
            if let error {
            } else {
                if let stringValue = result as? String {
                    text = stringValue
                }
                debugPrint("\(text)")
            }
        }
    }
}

struct ProfileView: UIViewRepresentable {
    @Binding var webView: WKWebView
    
    func makeUIView(context: Context) -> some UIView {
        webView.load(URLRequest(url: URL(string: "https://africastart.com")!))
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
