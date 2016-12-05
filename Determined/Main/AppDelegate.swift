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
        
        MagicalRecord.setupCoreDataStack(withStoreNamed: "c");
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
        user1?.companyName = "公司名字";
        let user2 = User.mr_createEntity();
        user2?.name = "bb";
        user2?.icon = "icon";
        user2?.companyName = "公司名字";
        
        let group1 = UserGroup.mr_createEntity();
        group1?.groupString = "a";
        group1?.groupItem = [user1!, user2!];
        
        
        let user3 = User.mr_createEntity();
        user3?.name = "cc";
        user3?.icon = "icon";
        user3?.companyName = "公司名字";
        let user4 = User.mr_createEntity();
        user4?.name = "dd";
        user4?.icon = "icon";
        user4?.companyName = "公司名字";
        
        let group2 = UserGroup.mr_createEntity();
        group2?.groupString = "b";
        group2?.groupItem = [user3!, user4!];
        
        let user5 = User.mr_createEntity();
        user5?.name = "ee";
        user5?.icon = "icon";
        user5?.companyName = "公司名字";
        let user6 = User.mr_createEntity();
        user6?.name = "ff";
        user6?.icon = "icon";
        user6?.companyName = "公司名字";
        
        let group3 = UserGroup.mr_createEntity();
        group3?.groupString = "c";
        group3?.groupItem = [user5!, user6!];
        
        let user8 = User.mr_createEntity();
        user8?.name = "ee";
        user8?.icon = "icon";
        user8?.companyName = "公司名字";
        let user9 = User.mr_createEntity();
        user9?.name = "ff";
        user9?.icon = "icon";
        user9?.companyName = "公司名字";
        
        let group4 = UserGroup.mr_createEntity();
        group4?.groupString = "d";
        group4?.groupItem = [user8!, user9!];
        
        let user10 = User.mr_createEntity();
        user10?.name = "10";
        user10?.icon = "icon";
        user10?.companyName = "公司名字";
        let user11 = User.mr_createEntity();
        user11?.name = "11";
        user11?.icon = "icon";
        user11?.companyName = "公司名字";
        let user12 = User.mr_createEntity();
        user12?.name = "12";
        user12?.icon = "icon";
        user12?.companyName = "公司名字";
        let group5 = UserGroup.mr_createEntity();
        group5?.groupString = "e";
        group5?.groupItem = [user10!, user11!, user12!];
        
        NSManagedObjectContext.mr_default().mr_save(blockAndWait: { (cxt) in
            print("保存完成");
        })
        
//        let array : [NSManagedObject] = UserGroup.mr_findAllSorted(by: "groupString", ascending: true)!;
//        print(array.count);
        
       
    }
}

