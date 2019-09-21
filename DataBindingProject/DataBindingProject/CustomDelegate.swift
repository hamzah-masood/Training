//
//  CustomDelegate.swift
//  DataBindingProject
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

//add observer method to make find out if any changes are made to the textfield so they can be passed to the view model label.

final class CustomDelegate {
  static let shared = CustomDelegate()
  
  private init() {}
  
  var objectArray: [Any] = []
  var object: Any?

  func addObject(updatedObject: Any) {
    objectArray.append(updatedObject )
  }
  
//  func addObserver(for event: String, eventNotifyClosure: @escaping ([String: Any]?) -> Void) -> UUID {
//    let specificID = UUID()
//    observerDictionary[event, default: []] += [(specificID, eventNotifyClosure)]
//    //    if var observers = observerDictionary[event] {
//    //      observers.append((UUID,eventNotifyClosure))
//    //      observerDictionary[event] = observers
//    ////      observerDictionary[event]?.append(eventNotifyClosure)
//    //    } else {
//    //      observerDictionary[event] = [eventNotifyClosure]
//    //    }
//    return specificID
//  }
//
//  func postEvent(named event: String, userInfo: [String: Any]? = nil) {
//    guard let observers = observerDictionary[event] else { return }
//    for observer in observers {
//      observer.1(userInfo)
//    }
//  }
//
//  func removeObserver(for id: UUID) {
//    for observers in observerDictionary {
//      var mutableObservers = observers.value
//      mutableObservers.removeAll(where: {$0.0 == id})
//      observerDictionary[observers.key] = mutableObservers
//
//    }
//  }
}
