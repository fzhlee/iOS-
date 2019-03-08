//
//  AppDelegate.swift
//  UIViewControllerProject_NavigationController4
//
//  Created by Jerry on 16/8/10.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let firstViewController = FirstViewController()
        let thirdViewController = ThirdViewController()
        
        let tabBarController = UITabBarController()
        let navigationController = UINavigationController(rootViewController: firstViewController)
        tabBarController.viewControllers = [navigationController, thirdViewController]
        
        let tabBar = tabBarController.tabBar
        let item = tabBar.items![0]
        item.image = UIImage(named: "Tab1")
        item.title = "item1"
        
        let item3 = tabBar.items![1]
        item3.image = UIImage(named: "Tab3")
        item3.title = "item3"
        
        window?.rootViewController = tabBarController

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

