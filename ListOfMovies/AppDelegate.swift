//
//  AppDelegate.swift
//  ListOfMovies
//
//  Created by Sanatzhan Aimukambetov on 02.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let vc = ViewController()
        window?.rootViewController = vc
        return true
    }


}

