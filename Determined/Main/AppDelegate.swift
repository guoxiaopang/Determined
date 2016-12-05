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
        
        tabbarVC = YXMainTabbarController();
        window?.rootViewController = tabbarVC;
        
        let label : YYFPSLabel = YYFPSLabel();
        label.frame = CGRect.init(x: 50, y: 20, width: 50, height: 30);
        self.window?.addSubview(label);
        
        MagicalRecord.setupCoreDataStack(withStoreNamed: "Determined");
        self.addData();
        return true
    }

    public func applicationWillTerminate(_ application: UIApplication)
    {
        MagicalRecord.cleanUp();
    }
    
    func addData()
    {
        let user1 = User.mr_createEntity();
        user1?.name = "aa";
        user1?.icon = "icon";
        let user2 = User.mr_createEntity();
        user1?.name = "bb";
        user1?.icon = "icon";
        
        let group1 = UserGroup.mr_createEntity();
        group1?.groupString = "第一组";
        group1?.groupItem = [user1!, user2!];
        
        NSManagedObjectContext.mr_default().mr_saveToPersistentStore(completion: nil);
        
        let array : [NSManagedObject] = UserGroup.mr_findAllSorted(by: "groupString", ascending: true)!;
        print(array.count);
    }
}

