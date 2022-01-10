//
//  AppDelegate.swift
//  iTunesSearchAPI
//
//  Created by Nurcihan Karayakalı on 5.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate let navigationController = UINavigationController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.createWindow()
        self.showSplashVC()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func createWindow() {
        let screenSize = UIScreen.main.bounds
        self.window = UIWindow(frame: screenSize)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = navigationController
    }
    
    func showSplashVC() {
        let storyboardBundle = Bundle.main
        // let storyboardBundle = Bundle(for: ClassName.self) // if you are not using main application, means may be you are crating a framework or library you can use this statement instead
        let storyboard = UIStoryboard(name: "Main", bundle: storyboardBundle)
        let splashVC = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        navigationController.pushViewController(splashVC, animated: false)
    }


}

