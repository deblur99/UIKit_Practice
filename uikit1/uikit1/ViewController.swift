//
//  ViewController.swift
//  uikit1
//
//  Created by 한현민 on 2023/07/14.
//

import UIKit

class ViewController: UIViewController {
    let heights: [Int] = [150, 230, 50, 45, 120]
    let labels: [String] = ["0", "1", "2", "3", "4"]
    let colors: [UIColor] = [UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.brown]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let firstFrame: CGRect = CGRect(x: 160, y: 240, width: 100, height: 150)
//
//        // x, y, width, height 위치만 잡혀 있는 둥둥 떠 있는 존재
//        let firstView = UIView(frame: firstFrame)
//        firstView.backgroundColor = UIColor.blue
//
//        // Point, Size -> Frame -> View -> SubView
//        let secondPoint = CGPoint(x: 130, y: 300)
//        let secondSize = CGSize(width: 130, height: 160)
//        let secondFrame = CGRect(origin: secondPoint, size: secondSize)
//        let secondView = UIView(frame: secondFrame)
//        secondView.backgroundColor = UIColor.red
//        self.view.addSubview(secondView)
//
//        // ViewController마다 내부 프로퍼티로 View 객체를 가지고 있다.
//        // SubView를 넣으면 뷰를 화면에 띄울 수 있다.
//        // 배경색을 넣어야 보인다. 실제로는 들어가 있음.
//        self.view.addSubview(firstView)

//        for index in 0 ... 10 {
//            let myView = UIView()
//            myView.frame.origin = CGPoint(x: index*10, y: index*20)
//            myView.frame.size = CGSize(width: 50, height: 50)
//            myView.backgroundColor = UIColor.red
//            self.view.addSubview(myView)
//        }

        let labelView = UILabel()
        labelView.text = "Team 21 Chart"
        labelView.textColor = UIColor.black
        labelView.textAlignment = .center
        labelView.frame.origin.x = 30
        labelView.frame.origin.y = 50
        labelView.frame.size.width = 150
        labelView.frame.size.height = 50
        view.addSubview(labelView)
        
        let divider = UIView()
        // 좌표는 origin, 크기는 size
        divider.frame.origin.x = 0
        divider.frame.origin.y = 100
        divider.frame.size.width = self.view.frame.size.width
        divider.frame.size.height = 0.72
        divider.backgroundColor = .gray
        view.addSubview(divider)

        var index = 0
        for height in heights {
            // View의 크기값은 frame 내에서!
//            let boxView = UIView(frame: CGRect(x: 100 + index * 50, y: 500 - height, width: 30, height: height))
            let boxView = UIView()
            // 좌표는 origin, 크기는 size
            boxView.frame.origin.y = CGFloat(120 + index * 40)
            boxView.frame.origin.x = 90
            boxView.frame.size.height = 20
            boxView.frame.size.width = CGFloat(height)
            boxView.backgroundColor = colors[index]
            view.addSubview(boxView)

            let labelView = UILabel()
            labelView.text = labels[index]
            labelView.textColor = .gray
            labelView.textAlignment = .center
            labelView.frame.origin.y = CGFloat(120 + index * 40)
            labelView.frame.origin.x = 50
            labelView.frame.size.height = 20
            labelView.frame.size.width = 20
            view.addSubview(labelView)

            index += 1
        }

        // 그래프마다 label을 달아주자 (0, 1, 또는 KR, JP, US, ...)
        // 하나 잘 만들면 아래쪽엔 위아래 막대그래프 말고 왼쪽에서 오른쪽으로 뻗는 막대그래프 만들어보기
    }
}
