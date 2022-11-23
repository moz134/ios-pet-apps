//
//  AppDelegate.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        PetsRouter.sharedInstance.launchApp()
        return true
    }
}
