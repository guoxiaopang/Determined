//
//  AppDelegate.swift
//  Determined
//
//  Created by duoyi on 16/11/28.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabbarVC : YXMainTabbarController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white;
        window?.makeKeyAndVisible();
        
        tabbarVC = YXMainTabbarController();
        window?.rootViewController = tabbarVC;
        
        let label : YYFPSLabel = YYFPSLabel();
        label.frame = CGRect.init(x: 50, y: 20, width: 50, height: 30);
        self.window?.addSubview(label);
        
        return true
    }


}

