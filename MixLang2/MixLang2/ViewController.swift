//
//  ViewController.swift
//  MixLang2
//
//  Created by 한현민 on 2023/07/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var operand1: UITextField!
    
    @IBOutlet weak var operand2: UITextField!
    
    @IBOutlet weak var opcode: UITextField!
    
    @IBOutlet weak var resultMsg: UILabel!
    
    let calc: MixCalc = MixCalc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButton(_ sender: Any) {
        resultMsg.text = calc.getResultWithMessage(opcode.text ?? "", with: Int32(operand1.text ?? "") ?? 0, with: Int32(operand2.text ?? "") ?? 0)
    }
}
