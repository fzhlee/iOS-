//
//  SingletonClass.swift
//  DemoApp
//
//  Created by Jerry on 16/5/20.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation
import SwiftyStoreKit
import PKHUD

final class IAP: NSObject
{
    static let shared = IAP()
    private override init() {}
    
    func purchase()
    {
        HUD.show(.progress)
        SwiftyStoreKit.purchaseProduct(INAPP_ID)
        { result in
            
            HUD.hide(animated: true)
            
            switch result
            {
                case .success( _):
                    IAP.shared.IAPPurchased(message: "购买成功，感谢支持！")
                case .error(let error):
                    print("Could not retrieve product info: \(error)")
            }
        }
    }
    
    func restorePurchases()
    {
        HUD.show(.progress)
        SwiftyStoreKit.restorePurchases()
            { results in
                
                HUD.hide(animated: true)
                
                if results.restoreFailedPurchases.count > 0
                {
                    print("Restore Failed: \(results.restoreFailedPurchases)")
                }
                else if results.restoredPurchases.count > 0
                {
                    IAP.shared.IAPPurchased(message: "恢复购买成功，感谢支持！")
                }
                else
                {
                    print("Nothing to Restore")
                }
        }
    }
    
    func showAlert(message:String)
    {
        let alert = UIAlertController(title: "提示信息", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(yes)
        
        let vc = UIApplication.shared.keyWindow?.rootViewController
        vc?.present(alert, animated: true, completion: nil)
    }
    
    func oncePurchasedIAP() -> Bool
    {
        return UserDefaults.standard.bool(forKey: "oncePurchasedIAP")
    }
    
    func IAPPurchased(message:String)
    {
        UserDefaults.standard.set(true, forKey: "oncePurchasedIAP")
        UserDefaults.standard.synchronize()
        showAlert(message:message)
    }
    
}
