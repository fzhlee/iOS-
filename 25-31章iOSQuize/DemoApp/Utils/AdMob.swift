//
//  SingletonClass.swift
//  DemoApp
//
//  Created by Jerry on 16/5/20.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation
import GoogleMobileAds

final class AdMob: NSObject, GADInterstitialDelegate
{
    static let shared = AdMob()
    var _interstitial : GADInterstitial!
    
    private override init() {
        
    }
    
    //MARK: -
    //MARK: 加载广告
    func loadInterstitial()
    {
        if IAP.shared.oncePurchasedIAP()
        {
            return
        }
        if _interstitial == nil || !_interstitial.isReady
        {
            _interstitial = GADInterstitial(adUnitID: ADMOB_ID)
            _interstitial.delegate = self
            
            let request = GADRequest()
            request.testDevices = [kGADSimulatorID]
            _interstitial.load(request)
        }
    }
    
    func showInterstitial()
    {
        if IAP.shared.oncePurchasedIAP()
        {
            return
        }
        if _interstitial != nil && _interstitial.isReady
        {
            let vc = UIApplication.shared.keyWindow?.rootViewController
            _interstitial.present(fromRootViewController: vc!)
        }
    }
}
