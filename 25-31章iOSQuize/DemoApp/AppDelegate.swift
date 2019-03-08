//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Jerry on 16/5/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BWWalkthroughViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if !Data.hasShowIntro()
        {
            let stb = UIStoryboard(name: "BWWalkthrough", bundle: nil)
            let walkthrough = stb.instantiateViewController(withIdentifier: "walk") as! BWWalkthroughViewController
            let page_zero = stb.instantiateViewController(withIdentifier: "walk0")
            let page_one = stb.instantiateViewController(withIdentifier: "walk1")
            let page_two = stb.instantiateViewController(withIdentifier: "walk2")
            let page_three = stb.instantiateViewController(withIdentifier: "walk3")
            
            walkthrough.delegate = self
            walkthrough.addViewController(page_one)
            walkthrough.addViewController(page_two)
            walkthrough.addViewController(page_three)
            walkthrough.addViewController(page_zero)
            
            self.window?.rootViewController = walkthrough
        }
        
        ShareSDK.registerActivePlatforms(
            [
                SSDKPlatformType.typeWechat.rawValue,
                SSDKPlatformType.typeQQ.rawValue
            ],
            onImport: {(platform : SSDKPlatformType) -> Void in
                switch platform
                {
                    case SSDKPlatformType.typeWechat:
                        ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                    case SSDKPlatformType.typeQQ:
                        ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                    default:
                        break
                }
        },
            onConfiguration: {(platform : SSDKPlatformType , appInfo : NSMutableDictionary?) -> Void in
                switch platform
                {
                    case SSDKPlatformType.typeWechat:
                        //设置微信应用信息
                        appInfo?.ssdkSetupWeChat(byAppId: "wxac6c29c06aaa0d8f", appSecret: "4aabbb631bfba5dd07fe38b92fe2ed02")
                    case SSDKPlatformType.typeQQ:
                        //设置QQ应用信息
                        appInfo?.ssdkSetupQQ(byAppId: "1106079593",
                                             appKey : "tjawfv7ipd2inTcV",
                                             authType: SSDKAuthTypeWeb)
                    default:
                        break
                }
        })
        return true
    }
    func walkthroughPageDidChange(_ pageNumber: Int)
    {
        print("Current Page \(pageNumber)")
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
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

