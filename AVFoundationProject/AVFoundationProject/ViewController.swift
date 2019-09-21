//
//  ViewController.swift
//  AVFoundationProject
//
//  Created by MCS on 9/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    guard let sharkURL = Bundle.main.url(forResource: "shark", withExtension: "mp4") else { return }
    
    let player = AVPlayer(url: sharkURL)
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = view.frame
    view.layer.addSublayer(playerLayer)
    player.play()
    
    
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    guard motion == .motionShake else { return }
    
    guard let sharkURL = Bundle.main.url(forResource: "shark", withExtension: "mp4") else { return }
    
    let player = AVPlayer(url: sharkURL)   
    let avPlayerController = AVPlayerViewController()
    avPlayerController.player = player
    present(avPlayerController, animated: true, completion: nil)
  }
  
}

