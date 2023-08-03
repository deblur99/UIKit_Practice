//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/02.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
    
}
