//
//  ViewController.swift
//  gestureRecognizerProject
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var movingLabel: UILabel!
  private var initialPoint: CGPoint!
  var isTapped = false
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addRotationGesture()
    addPanGesture()
    addPinchGesture()
    addTapGesture()
  }
  
  func addRotationGesture() {
    let rotationGestureRecognizer = UIRotationGestureRecognizer()
    rotationGestureRecognizer.addTarget(self, action: #selector(rotateTheLabel(sender:)))
    movingLabel.addGestureRecognizer(rotationGestureRecognizer)
  }

  @objc func rotateTheLabel(sender: UIRotationGestureRecognizer) {
    print("the label was rotated \(sender.rotation) radians")
    let rotatedTransform = CGAffineTransform(rotationAngle: sender.rotation)
    movingLabel.transform = rotatedTransform
  }
  
  func addPanGesture() {
    let movingGestureRecognizer = UIPanGestureRecognizer()
    movingGestureRecognizer.addTarget(self, action: #selector(moveTheLabel(sender:)))
    movingLabel.addGestureRecognizer(movingGestureRecognizer)
    movingLabel.isUserInteractionEnabled = true
    initialPoint = movingLabel.frame.origin
  }
  
  @objc func moveTheLabel(sender: UIPanGestureRecognizer) {
    print("the label was dragged to point \(sender.translation(in: view))" )
    let translatePoint = sender.translation(in: view)
    
    sender.view?.frame.origin.x = initialPoint.x + translatePoint.x
    sender.view?.frame.origin.x = initialPoint.y + translatePoint.y
  }

  func addPinchGesture() {
    let pinchGestureRecognizer = UIPinchGestureRecognizer()
    pinchGestureRecognizer.addTarget(self, action: #selector(pinchTheLabel(sender:)))
    movingLabel.addGestureRecognizer(pinchGestureRecognizer)
  }
  @objc func pinchTheLabel(sender: UIPinchGestureRecognizer) {
    print("the label was pinched")
    let pinchedTransform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    movingLabel.transform = pinchedTransform
  }
  
  func addTapGesture() {
    let tappedGestureRecognizer = UITapGestureRecognizer()
    tappedGestureRecognizer.addTarget(self, action: #selector(tapTheLabel(sender:)))
    tappedGestureRecognizer.numberOfTapsRequired = 2
    movingLabel.addGestureRecognizer(tappedGestureRecognizer)
  }
  
  @objc func tapTheLabel(sender: UITapGestureRecognizer) {
    print("label was tapped")
    if isTapped == false {
      movingLabel.text? = "Moving Label was double tapped"
      isTapped = true
    }
    else if isTapped == true {
      movingLabel.text? = "Moving Label"
      isTapped = false
    }
  }
  


}

