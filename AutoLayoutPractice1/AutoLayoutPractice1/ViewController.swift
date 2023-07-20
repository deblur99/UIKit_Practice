//
//  ViewController.swift
//  AutoLayoutPractice1
//
//  Created by 한현민 on 2023/07/19.
//

import UIKit

enum CalculateMode {
    case CELCIUS, FAHRENHEIT
}

class ViewController: UIViewController {
    var mode: CalculateMode = .CELCIUS
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "온도를 입력하세요."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .S
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let convertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let toggle: UISwitch = {
        let toggleSwitch = UISwitch()
        if toggleSwitch.isOn {
            changeCalcMode(dest: .CELCIUS)
        } else {
            changeCalcMode(dest: .FAHRENHEIT)
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        putAllViews()
    }
    
    func putAllViews() {
        stackView.addSubview(textField)
        stackView.addSubview(convertButton)
        stackView.addSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func changeCalcMode(dest: CalculateMode) {
        self.mode = dest
    }
    
    @objc func convertTemperature() {
        guard let valueFromTextField = textField.text, let number = Double(valueFromTextField) else {
            label.text = "값을 입력하세요"
            return
        }
        
        let result = (number - 32) * 5/9
        label.text = String(result)
    }
}

