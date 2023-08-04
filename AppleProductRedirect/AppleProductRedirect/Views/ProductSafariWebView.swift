//
//  ProductWebView.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import SwiftUI
import SafariServices

struct ProductSafariWebView: UIViewControllerRepresentable {
    // 옵셔널로 넘기면 왜 되지
    var option: Option?
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: URL(string: option?.urlString ?? "")!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
