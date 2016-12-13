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
        
     
        window?.addObserver(self, forKeyPath: "rootViewController", options: NSKeyValueObservingOptions.new, context: nil);
        MagicalRecord.setupCoreDataStack(withStoreNamed: "d.sqlite");
        self.window?.addSubview(label);
 
        return true
    }
    
    private lazy var label : YYFPSLabel = {
        let label : YYFPSLabel = YYFPSLabel();
        label.frame = CGRect.init(x: 50, y: 20, width: 50, height: 30);
        
        return label;
    }()

    public func applicationWillTerminate(_ application: UIApplication)
    {
        MagicalRecord.cleanUp();
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        if (window?.rootViewController?.isKind(of: YXHomeViewController.classForCoder()))! || (window?.rootViewController?.isKind(of: YXHistoryViewController.classForCoder()))!
        {
             self.window?.bringSubview(toFront: label);
        }
       
    }
    
    deinit
    {
        window?.removeObserver(self, forKeyPath: "rootViewController", context: nil);
    }
    
}

