//
//  SceneDelegate.swift
//  AppleTopAlbums
//
//  Created by Hamzah Masood on 4/28/20.
//  Copyright © 2020 Hamzah Masood. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow.init(windowScene: scene)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: AlbumTableViewController())
        
    }

    


}

