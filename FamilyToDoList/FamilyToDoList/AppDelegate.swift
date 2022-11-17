//
//  AppDelegate.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 6/26/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationVC = UINavigationController()
        let loginVC = LoginInitializer.initializeModule().viewController
        navigationVC.viewControllers = [loginVC]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationVC
        
        return true
    }
}
