//
//  Option.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import Foundation
import SwiftUI

struct Option: Identifiable {
    var id = UUID()
    
    let type: String = "macbook"
    let lineup: String = "air"
    let screenSize: Int = 15
    var title: String {
        "\(type.capitalized) \(lineup.capitalized) \(screenSize)"
    }
    
    var color: Colors
    var chipset: Chipset
    var memory: Memory
    
    var urlString: String {
        let foo = "https://www.apple.com/kr/shop/buy-mac/\(type)-\(lineup)/\(screenSize)형-\(color.colorString)-\(chipset.string)-\(memory.string)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        print(foo)
        return foo
    }
    var url: URL {
        URL(string: urlString)!
    }
}

extension Option {
    
}


enum Colors {
    case midnight, starlight, spacegray, silver
    
    var colorString: String {
        switch self {
        case .midnight:
            return "미드나이트"
        case .silver:
            return "실버"
        case .spacegray:
            return "스페이스-그레이"
        case .starlight:
            return "스타라이트"
        }
    }

    var colorStringFormal: String {
        switch self {
        case .midnight:
            return "미드나이트"
        case .silver:
            return "실버"
        case .spacegray:
            return "스페이스 그레이"
        case .starlight:
            return "스타라이트"
        }
    }
    
    var colorImage: Image {
        switch self {
        case .midnight:
            return Image("midnight")
        case .silver:
            return Image("silver")
        case .spacegray:
            return Image("spacegray")
        case .starlight:
            return Image("starlight")
        }
    }
}

struct Chipset {
    var manufacturer: String    // Apple
    var name: String            // M2
    var cpuCore: Int            // 8코어 CPU
    var gpuCore: Int            // 10코어 GPU
    
    var string: String {
        "\(manufacturer.lowercased())-\(name.lowercased())-칩(\(cpuCore)코어-cpu-및-\(gpuCore)코어-gpu)"
    }
    
    var stringFormal: String {
        "\(manufacturer.capitalized(with: .current)) \(name.capitalized(with: .current)) 칩 \n(\(cpuCore)코어 CPU 및 \(gpuCore)코어 GPU)"
    }
}

struct Memory {
    // 램 용량은 URL에 영향을 주지 않기 때문에, 스토리지 용량만 적도록 한다.
    var storage: Int
    var scale: String
    
    var string: String {
        "\(storage)\(scale.lowercased())"
    }
    
    var stringFormal: String {
        "\(storage)\(scale.uppercased())"
    }
}
