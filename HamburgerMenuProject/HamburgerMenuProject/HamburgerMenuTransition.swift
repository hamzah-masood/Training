//
//  HamburgerMenuTransition.swift
//  HamburgerMenuProject
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

final class HamburgerMenuTransition: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let hamburgerMenuViewController: UIViewController
    let isMenuPresenting: Bool
    if let toViewController = transitionContext.viewController(forKey: .to), toViewController is HamburgerMenuViewController {
      hamburgerMenuViewController = toViewController
      isMenuPresenting = true
    } else if let fromViewController = transitionContext.viewController(forKey: .from), fromViewController is HamburgerMenuViewController {
      hamburgerMenuViewController = fromViewController
      isMenuPresenting = false
    } else {
      return
    }
    transitionContext.containerView.addSubview(hamburgerMenuViewController.view)
    if isMenuPresenting {
      hamburgerMenuViewController.view.frame.origin.x = -UIScreen.main.bounds.width
    }
    UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
      if isMenuPresenting {
        hamburgerMenuViewController.view.frame.origin.x = 0
      } else {
        hamburgerMenuViewController.view.frame.origin.x = -UIScreen.main.bounds.width
      }
    }) { didFinish in
      transitionContext.completeTransition(didFinish)
    }
    
  }
  
  
}
