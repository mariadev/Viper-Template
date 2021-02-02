//
//  AppDelegate.swift
//  ViperTemplate
//
//  Created by Maria on 02/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeView = HomeWireFrame.createHomeModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeView
        window?.makeKeyAndVisible()
        
        return true
    }



}

