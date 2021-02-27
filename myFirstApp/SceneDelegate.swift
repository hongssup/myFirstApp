//
//  SceneDelegate.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        //guard let _ = (scene as? UIWindowScene) else { return }
        
        //window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: BottomNavigation())
        window?.makeKeyAndVisible()
    }

}

