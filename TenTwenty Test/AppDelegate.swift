//
//  AppDelegate.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 18/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNavigationController : UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard: UIStoryboard  = UIStoryboard(name:"Main", bundle:nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainVC")
        self.mainNavigationController = UINavigationController.init(rootViewController: mainVC)
        self.mainNavigationController?.navigationBar.isHidden = true
        self.mainNavigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.window?.rootViewController = self.mainNavigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

