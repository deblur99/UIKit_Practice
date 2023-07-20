    //
//  ViewController.swift
//  gigacoffee
//
//  Created by 한현민 on 2023/07/20.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let getLabel = {
            (s: String) -> UILabel in
            let label = UILabel()
            label.text = s
            label.textColor = .red
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        let labels: [UILabel] = [getLabel("AAAAA"), getLabel("BBBBB"), getLabel("CCCCC")]
        view.addSubview(labels[0])
        
        let stackView = {
            let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .vertical
            sv.alignment = .center
            sv.distribution = .fillEqually
            sv.spacing = 20
            return sv
        }()

        for label in labels {
            // StackView 내부에 Subview 추가할 때에는 addArrangeSubView() 사용
            stackView.addArrangedSubview(label)
        }

        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 400),
            stackView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
