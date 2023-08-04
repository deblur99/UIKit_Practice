//
//  OptionModel.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import Foundation

class OptionModel: ObservableObject {
    // 장바구니 상품 목록
    @Published var options: [Option] = OptionModel.sampleData
    
    func addOption(option: Option) {
        options.append(option)
    }
    
    func deleteOption(at offsets: IndexSet) {
        options.remove(atOffsets: offsets)
    }
    
    func updateOption(index: Int, option: Option) {
        options[index] = option
    }
}

extension OptionModel {
    static let sampleData: [Option] = [
        Option(color: .spacegray, chipset: .init(manufacturer: "Apple", name: "M2", cpuCore: 8, gpuCore: 10), memory: .init(storage: 256, scale: "GB")),
        Option(color: .spacegray, chipset: .init(manufacturer: "Apple", name: "M2", cpuCore: 8, gpuCore: 10), memory: .init(storage: 512, scale: "GB"))
    ]
    
    static let availableProducts: [String] = [
        "MacBook Air 13", "MacBook Air 15"
    ]
}
