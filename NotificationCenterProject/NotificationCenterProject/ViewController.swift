//
//  ViewController.swift
//  NotificationCenterProject
//
//  Created by MCS on 9/6/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  static let customNotification = NSNotification.Name("custom notification")

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    NewNotificationCenter.shared.addObserver(for: "custom notification", eventNotifyClosure: wasnotified(with:))
    
//    NotificationCenter.default.addObserver(self,
//                                           selector: #selector(wasNotified),
//                                           name: ViewController.customNotification,
//                                           object: nil)
    
  }
  
//  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//    guard motion == .motionShake else { return }
//    //NotificationCenter.default.post(name: ViewController.customNotification, object: nil, userInfo: ["username" : "Hamzah"])
//    NewNotificationCenter.shared.postEvent(named: ViewController.customNotification.rawValue, userInfo: ["username":"Hamzah"])
//  }
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    guard motion == .motionShake else { return }
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
    navigationController?.pushViewController(viewController, animated: true)
  }

  
  @objc func wasNotified(_ notification: NSNotification) {
    print("I was notified of an event")
    print("New username is \(notification.userInfo?["username"])")
  }
  
  func wasnotified(with info: [String: Any]?) {
    print("I was notified of an event")
    print("New username is \(info?["username"])")
  }

}

