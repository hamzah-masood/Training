//
//  ViewController.swift
//  CAShapeLayerProject
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let topLine = CAShapeLayer()
  let middleLine = CAShapeLayer()
  let bottomLine = CAShapeLayer()
  let path = UIBezierPath()
  let animation = CABasicAnimation(keyPath: "strokeEnd")
  var tapped = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    path.move(to: CGPoint(x: 100, y: 150))
    path.addLine(to: CGPoint(x: 200, y: 150))
    topLine.path = path.cgPath
    topLine.strokeColor = UIColor.black.cgColor
    topLine.lineWidth = 4

    
    view.layer.addSublayer(topLine)
    
    path.move(to: CGPoint(x: 100, y: 200))
    path.addLine(to: CGPoint(x: 200, y: 200))
    middleLine.path = path.cgPath
    middleLine.strokeColor = UIColor.black.cgColor
    middleLine.lineWidth = 4


    view.layer.addSublayer(middleLine)

    path.move(to: CGPoint(x: 100, y: 250))
    path.addLine(to: CGPoint(x: 200, y: 250))
    bottomLine.path = path.cgPath
    bottomLine.strokeColor = UIColor.black.cgColor
    bottomLine.lineWidth = 4


    view.layer.addSublayer(bottomLine)
    
    

    
  }
  
//  func createLine(xValue: Double, yValue: Double) {
//    //let lineLayer = CAShapeLayer()
//    //let path = UIBezierPath()
//    let x = xValue
//    let y = yValue
//    path.move(to: CGPoint(x: x, y: y))
//    path.addLine(to: CGPoint(x: x + 100, y: y))
//    //path.addArc(withCenter: CGPoint(x: 100, y: 150), radius: 50, startAngle: CGFloat(M_PI), endAngle: CGFloat(2 * M_PI), clockwise: true)
//    lineLayer.path = path.cgPath
//    lineLayer.strokeColor = UIColor.black.cgColor
//    lineLayer.lineWidth = 4
//
//    view.layer.addSublayer(lineLayer)
//  }

  func animateBottomLine() {
    //let animation = CABasicAnimation(keyPath: "strokeEnd")
    //animation.fromValue = 0
    //animation.toValue = 1//CATransform3DRotate(lineLayer.transform, CGFloat(135 * Float.pi / 180), 0, 0, 1)
    animation.duration = 2
    animation.fillMode = CAMediaTimingFillMode.forwards
    animation.isRemovedOnCompletion = false
    //animation.autoreverses = true
    //animation.repeatCount = .infinity
    //bottomeLine.transform = CATransform3DRotate(bottomeLine.transform, CGFloat(M_PI/9), CGFloat(M_PI), 0, 1)

    
    bottomLine.transform = CATransform3DTranslate(bottomLine.transform, -4, 0, 0)
    bottomLine.transform = CATransform3DRotate(bottomLine.transform, CGFloat(-M_PI_4), 0, 0, 1)
    bottomLine.add(animation, forKey: "line")

  }
  
  func animateMiddleLine() {
    //let animation = CABasicAnimation(keyPath: "strokeEnd")
    //animation.fromValue = 0
    //animation.toValue = CATransform3DRotate(middleLine.transform, CGFloat(135 * Float.pi / 180), 0, 0, 1)
    animation.duration = 2
    animation.fillMode = CAMediaTimingFillMode.forwards
    animation.isRemovedOnCompletion = false
    //animation.autoreverses = true
    //animation.repeatCount = .infinity
    
    middleLine.transform = CATransform3DRotate(middleLine.transform, 10, 0,  0, 5)
    
    middleLine.add(animation, forKey: "line")
    
  }
  
  func animateTopLine() {
    //let animation = CABasicAnimation(keyPath: "strokeEnd")
    //animation.fromValue = 0
    //animation.toValue = 1//CATransform3DRotate(lineLayer.transform, CGFloat(135 * Float.pi / 180), 0, 0, 1)
    animation.duration = 2
    animation.fillMode = CAMediaTimingFillMode.forwards
    animation.isRemovedOnCompletion = false
    //animation.autoreverses = true
    //animation.repeatCount = .infinity
    //topLine.transform = CATransform3DRotate(topLine.transform,  CGFloat(M_PI/180), 1, 0, 0)
    
    
    
    topLine.add(animation, forKey: "line")
    
  }
  
  @IBAction func tapAnimation(_ sender: Any) {
    
    //animateBottomLine()
    animateMiddleLine()
    //animateTopLine()
    
  }
  
}

