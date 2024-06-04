//
//  UIBezierPath.swift
//  Demo_BezierPath
//
//  Created by Yejin Hong on 2022/12/02.
//

import UIKit

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let view = MyView(frame: self.view.frame)
//        view.backgroundColor = .white
//        self.view.addSubview(view)
//    }
//}
//
//class MyView: UIView {
//    override func draw(_ rect: CGRect) {
//        let center = CGPoint(x: rect.midX, y: rect.midY)
//        let values: [CGFloat] = [65, 20, 10, 2, 2, 1]
//        let total = values.reduce(0, +)
//        var startAngle: CGFloat = 0.0
//        var endAngle: CGFloat = 0.0
//        let colors: [UIColor] = [.red, .orange, .black, .systemPink, .yellow, .green, .blue, .gray]
//
//        let outCircle = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
//        UIColor.white.set()
//        outCircle.fill()
//
//        values.forEach { (value) in
//            endAngle = (value / total) * (.pi * 2)
//
//            let path = UIBezierPath()
//            path.lineWidth = 3
//            path.move(to: center)
//            path.addArc(withCenter: center, radius: 80, startAngle: startAngle, endAngle: startAngle + endAngle, clockwise: true)
//            colors.randomElement()?.set()
//            path.close()
//            colors.randomElement()?.set()
//            path.fill()
//            startAngle += endAngle
//
//            UIColor.white.set()
//            path.stroke()
//        }
//
//        let semiCircle = UIBezierPath(arcCenter: center, radius: 40, startAngle: 0, endAngle: (360 * .pi) / 180, clockwise: true)
//        UIColor.white.set()
//        semiCircle.fill()
//    }
//}
