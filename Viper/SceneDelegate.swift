//
//  SceneDelegate.swift
//  Viper
//
//  Created by Yaroslav Krasnokutskiy on 30.7.22..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        // Start
        let userRouter = UserRouter.start()
        let entryView =  userRouter.entry
        window.rootViewController = entryView
        self.window = window
        window.makeKeyAndVisible()
    }
}

