//
//  AppDelegate.swift
//  pawsome
//
//  Created by Lovice Sunuwar on 22/03/2022.
//

import UIKit

let deploymentMode: DeploymentMode = .local

/// GLOBAL VARIABLE CREATED
var appDelegate: AppDelegate {
    return (UIApplication.shared.delegate as! AppDelegate)
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let defaults = UserDefaults.standard
        let username = defaults.value(forKey: "username")
        if username != nil {
            goToDashboardPage()
        }
        return true
    }
    
    // To Change root vc to login (call when logout)
    func goToLoginPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InitialNavigation") as! UINavigationController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    // To Change root vc to main task page (call when login)
    func goToDashboardPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainNavigation") as! UINavigationController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    
}
