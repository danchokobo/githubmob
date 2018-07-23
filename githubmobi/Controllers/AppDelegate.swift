//
//  AppDelegate.swift
//  githubmobi
//
//  Created by Danagul Otel on 23.07.2018.
//  Copyright © 2018 Danagul Otel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureAppereance()
        configureRootViewController()
        return true
    }
    
    func configureAppereance() {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        appearance.tintColor = .black
        
    }
    
    func configureRootViewController() {
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
    }
    
}


