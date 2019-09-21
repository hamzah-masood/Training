//
//  AppDelegate.swift
//  FilterClosureProject
//
//  Created by MAC on 7/30/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    print([1, 2, 3].sorted { _, _ in false })
    FilterSortClosureAssignment().test()
    return true
  }
}

