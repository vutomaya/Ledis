//
//  AppDelegate.swift
//  ledis
//
//  Created by Maya Vu on 30.04.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        UINavigationBar.appearance().barTintColor = StyleManager.Colors.navigationBarBarTint
        UINavigationBar.appearance().tintColor = StyleManager.Colors.navigationBarTint
        UINavigationBar.appearance().titleTextAttributes = StyleManager.Colors.navigationBarTitleTextAttributes
        return true
    }
}

