//
//  ViewController.swift
//  uikit1
//
//  Created by 한현민 on 2023/07/14.
//

import UIKit

class ViewController: UIViewController {
    let graphDataArray: [GraphData] = [
        GraphData(name: "한국", value: 150, color: .blue, flag: "🇰🇷"),
        GraphData(name: "일본", value: 130, color: .brown, flag: "🇯🇵"),
        GraphData(name: "미국", value: 100, color: .cyan, flag: "🇺🇸"),
        GraphData(name: "중국", value: 70, color: .green, flag: "🇨🇳"),
        GraphData(name: "영국", value: 200, color: .magenta, flag: "🇬🇧"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth: CGFloat = self.view.frame.size.width
        let hGraphWidth: CGFloat = CGFloat(graphDataArray.count * 60 - 10)
        let hGraphX: CGFloat = (screenWidth - hGraphWidth) / 2
        
        let hGraphView = UIView()
//        hGraphView.backgroundColor = .lightGray   // 영역이 어디 있는지 모를 때는 임시로 배경색을 깔아두는 것이 편리하다!
        
        // 또는, 테두리를 임시로 만들어서 영역을 확인할 수도 있다.
        hGraphView.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 1, alpha: 1)
        hGraphView.layer.borderWidth = 1
        
        hGraphView.clipsToBounds = true
        hGraphView.frame.origin = CGPoint(x: 10, y: 100)
        hGraphView.frame.size = CGSize(width: screenWidth - 10 * 2, height: 300)
        self.view.addSubview(hGraphView)
        
        let hGraphViewWidth = hGraphView.frame.size.width
        
        let hTitleLabel = UILabel()
        hTitleLabel.text = "높이 막대 그래프"
        hTitleLabel.textAlignment = .center
        hTitleLabel.frame.origin = CGPoint(x: 5, y: 5)
        hTitleLabel.frame.size = CGSize(width: hGraphViewWidth - 5 * 2, height: 30)
        hGraphView.addSubview(hTitleLabel) // 어떤 뷰 안에 다른 뷰가 들어간다.
        
        
        var index = 0
        for graphData in self.graphDataArray {
            let name: String = graphData.name
            let value: Int = graphData.value
            let color: UIColor = graphData.color
            let flag: String = graphData.flag
            
            let nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.textAlignment = .center
            nameLabel.frame.origin = CGPoint(x: 0 + 60 * index, y: 250)
            nameLabel.frame.size = CGSize(width: 50, height: 50)
            hGraphView.addSubview(nameLabel)
            
            let valueView = UIView()
            valueView.backgroundColor = color
            valueView.frame.origin = CGPoint(x: 0 + 60 * index, y: 250 - value)
            valueView.frame.size = CGSize(width: 50, height: value)
            hGraphView.addSubview(valueView)
            
            let flagView = UILabel()
            flagView.text = flag
            flagView.font = UIFont(name: "Helvetica", size: 40)
            flagView.textAlignment = .center
//            flagView.backgroundColor = color
            flagView.frame.origin = CGPoint(x: 0 + 60 * index, y: 250 - value - 50)
            flagView.frame.size = CGSize(width: 50, height: 50)
            hGraphView.addSubview(flagView)
            
            index += 1
        }
        
        let wGraphView = UIView()
        wGraphView.backgroundColor = .lightGray
        wGraphView.frame.origin = CGPoint(x: 10, y: 450)
        wGraphView.frame.size = CGSize(width: screenWidth - 10 * 2, height: 350)
        self.view.addSubview(wGraphView)
        
        let wGraphViewWidth = wGraphView.frame.size.width
        
        let wTitleLabel = UILabel()
        wTitleLabel.text = "넓이 막대 그래프"
        wTitleLabel.textAlignment = .center
        wTitleLabel.frame.origin = CGPoint(x: 5, y: 5)
        wTitleLabel.frame.size = CGSize(width: wGraphViewWidth - 5 * 2, height: 30)
        wGraphView.addSubview(wTitleLabel)
        
        index = 0
        for graphData in self.graphDataArray {
            let name: String = graphData.name
            let value: Int = graphData.value
            let color: UIColor = graphData.color
            let flag: String = graphData.flag
            
            let nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.textAlignment = .center
//            nameLabel.backgroundColor = .cyan
            nameLabel.frame.origin = CGPoint(x: 0, y: 50 + index * 60)
            nameLabel.frame.size = CGSize(width: 50, height: 50)
            wGraphView.addSubview(nameLabel)
            
            let valueView = UIView()
            valueView.backgroundColor = color
            valueView.frame.origin = CGPoint(x: 50, y: 50 + index * 60)
            valueView.frame.size = CGSize(width: value, height: 50)
            wGraphView.addSubview(valueView)
            
            let flagView = UILabel()
            flagView.text = flag
            flagView.font = UIFont(name: "Helvetica", size: 40)
            flagView.textAlignment = .center
//            flagView.backgroundColor = color
            flagView.frame.origin = CGPoint(x: 50 + index, y: 50 + index * 60)
            flagView.frame.size = CGSize(width: 50, height: 50)
            wGraphView.addSubview(flagView)
            
            index += 1
        }
        
        let firstView = hGraphView
        let secondView = wGraphView
        
        firstView.frame.origin.y = 50
        
        let firstY = firstView.frame.origin.y
        let firstHeight = firstView.frame.size.height
        
        secondView.frame.origin.y = firstY + firstHeight + 20
    }
}

// class ViewController: UIViewController {
//    let heights: [Int] = [150, 230, 50, 45, 120]
//    let labels: [String] = ["0", "1", "2", "3", "4"]
//    let colors: [UIColor] = [UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.brown]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
////        let firstFrame: CGRect = CGRect(x: 160, y: 240, width: 100, height: 150)
////
////        // x, y, width, height 위치만 잡혀 있는 둥둥 떠 있는 존재
////        let firstView = UIView(frame: firstFrame)
////        firstView.backgroundColor = UIColor.blue
////
////        // Point, Size -> Frame -> View -> SubView
////        let secondPoint = CGPoint(x: 130, y: 300)
////        let secondSize = CGSize(width: 130, height: 160)
////        let secondFrame = CGRect(origin: secondPoint, size: secondSize)
////        let secondView = UIView(frame: secondFrame)
////        secondView.backgroundColor = UIColor.red
////        self.view.addSubview(secondView)
////
////        // ViewController마다 내부 프로퍼티로 View 객체를 가지고 있다.
////        // SubView를 넣으면 뷰를 화면에 띄울 수 있다.
////        // 배경색을 넣어야 보인다. 실제로는 들어가 있음.
////        self.view.addSubview(firstView)
//
////        for index in 0 ... 10 {
////            let myView = UIView()
////            myView.frame.origin = CGPoint(x: index*10, y: index*20)
////            myView.frame.size = CGSize(width: 50, height: 50)
////            myView.backgroundColor = UIColor.red
////            self.view.addSubview(myView)
////        }
//
//        let labelView = UILabel()
//        labelView.text = "Team 21 Chart"
//        labelView.textColor = UIColor.black
//        labelView.textAlignment = .center
//        labelView.frame.origin.x = 30
//        labelView.frame.origin.y = 50
//        labelView.frame.size.width = 150
//        labelView.frame.size.height = 50
//        view.addSubview(labelView)
//
//        let divider = UIView()
//        // 좌표는 origin, 크기는 size
//        divider.frame.origin.x = 0
//        divider.frame.origin.y = 100
//        divider.frame.size.width = self.view.frame.size.width
//        divider.frame.size.height = 0.72
//        divider.backgroundColor = .gray
//        view.addSubview(divider)
//
//        var index = 0
//        for height in heights {
//            // View의 크기값은 frame 내에서!
////            let boxView = UIView(frame: CGRect(x: 100 + index * 50, y: 500 - height, width: 30, height: height))
//            let boxView = UIView()
//            // 좌표는 origin, 크기는 size
//            boxView.frame.origin.y = CGFloat(120 + index * 40)
//            boxView.frame.origin.x = 90
//            boxView.frame.size.height = 20
//            boxView.frame.size.width = CGFloat(height)
//            boxView.backgroundColor = colors[index]
//            view.addSubview(boxView)
//
//            let labelView = UILabel()
//            labelView.text = labels[index]
//            labelView.textColor = .gray
//            labelView.textAlignment = .center
//            labelView.frame.origin.y = CGFloat(120 + index * 40)
//            labelView.frame.origin.x = 50
//            labelView.frame.size.height = 20
//            labelView.frame.size.width = 20
//            view.addSubview(labelView)
//
//            index += 1
//        }
//
//        // 그래프마다 label을 달아주자 (0, 1, 또는 KR, JP, US, ...)
//        // 하나 잘 만들면 아래쪽엔 위아래 막대그래프 말고 왼쪽에서 오른쪽으로 뻗는 막대그래프 만들어보기
//    }
// }
