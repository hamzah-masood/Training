//
//  ViewController.swift
//  HamburgerMenuProject
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func didTapMenu(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let hamburgerMenuViewController = storyboard.instantiateViewController(withIdentifier: "HamburgerMenuViewController")
    hamburgerMenuViewController.transitioningDelegate = self
    present(hamburgerMenuViewController, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

extension ViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return HamburgerMenuTransition()
  }
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return HamburgerMenuTransition()
  }

}
