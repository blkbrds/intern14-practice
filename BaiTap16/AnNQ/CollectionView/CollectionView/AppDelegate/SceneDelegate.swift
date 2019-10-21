//
//  SceneDelegate.swift
//  CollectionView
//
//  Created by MBA0217 on 10/14/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScreen = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScreen)
        if (connectionOptions.userActivities.first ?? session.stateRestorationActivity) != nil {
          // Now what? How to connect the UI restored in the AppDelegate to this window?
        } else {
            // Create the initial UI if there is nothing to restore
            let homeVC = HomeViewController()
            let homeNC = UINavigationController(rootViewController: homeVC)
            homeNC.tabBarItem = UITabBarItem(title: "Home ", image: UIImage(named: "home"), tag: 0)

            let friendVC = FriendViewController()
            let friendNC = UINavigationController(rootViewController: friendVC)
            friendNC.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "friend"), tag: 1)

            let messageVC = MessageViewController()
            let messageNC = UINavigationController(rootViewController: messageVC)
            messageNC.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "message"), tag: 2)

            let profileVC = ProfileViewController()
            let profileNC = UINavigationController(rootViewController: profileVC)
            profileNC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 2)

            //Config tab bar controller
            let viewControllers = [homeNC, friendNC, messageNC, profileNC]
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = viewControllers

            self.window?.rootViewController = tabBarController
            window?.backgroundColor = .white
            window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

