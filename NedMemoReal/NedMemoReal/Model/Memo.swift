//
//  Memo.swift
//  NedMemoReal
//
//  Created by 한현민 on 2023/08/16.
//

import Foundation

struct Memo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var text: String
}

extension Memo {
    static let sampleArray: [Memo] = [
        Memo(text: "aa"),
        Memo(text: "bb"),
        Memo(text: "cc")
    ]
}
