//
//  AppDelegate.swift
//  Determined
//
//  Created by duoyi on 16/11/28.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabbarVC : YXMainTabbarController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white;
        window?.makeKeyAndVisible();
        
//        tabbarVC = YXMainTabbarController();
//        window?.rootViewController = tabbarVC;
        
        
        let history = YXHistoryViewController();
        let navigationVC : YXNavigationController = YXNavigationController(rootViewController : history);
        window?.rootViewController = navigationVC;
        
//        let label : YYFPSLabel = YYFPSLabel();
//        label.frame = CGRect.init(x: 50, y: 20, width: 50, height: 30);
//        self.window?.insertSubview(label, at: 10);
        
        MagicalRecord.setupCoreDataStack(withStoreNamed: "d.sqlite");

        //self.addData();
        return true
    }

    public func applicationWillTerminate(_ application: UIApplication)
    {
        MagicalRecord.cleanUp();
    }
    
}

