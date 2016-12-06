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
        user1?.uuid = NSUUID().uuidString
      
        let user2 = User.mr_createEntity();
        user2?.name = "bb";
        user2?.icon = "icon";
        user2?.uuid = NSUUID().uuidString
        user2?.companyName = "公司名字";
        
        let group1 = UserGroup.mr_createEntity();
        group1?.groupString = "A";
        group1?.groupItem = [user1!, user2!];
        
        
        let user3 = User.mr_createEntity();
        user3?.name = "B";
        user3?.icon = "icon";
        user3?.companyName = "公司名字";
        user3?.uuid = NSUUID().uuidString
        let user4 = User.mr_createEntity();
        user4?.name = "dd";
        user4?.icon = "icon";
        user4?.companyName = "公司名字";
        user4?.uuid = NSUUID().uuidString
        
        let group2 = UserGroup.mr_createEntity();
        group2?.groupString = "C";
        group2?.groupItem = [user3!, user4!];
        
        let user5 = User.mr_createEntity();
        user5?.name = "ee";
        user5?.icon = "icon";
        user5?.companyName = "公司名字";
        user5?.uuid = NSUUID().uuidString
        let user6 = User.mr_createEntity();
        user6?.name = "ff";
        user6?.icon = "icon";
        user6?.companyName = "公司名字";
        user6?.uuid = NSUUID().uuidString
        
        let group3 = UserGroup.mr_createEntity();
        group3?.groupString = "D";
        group3?.groupItem = [user5!, user6!];
        
        
        let user8 = User.mr_createEntity();
        user8?.name = "ee";
        user8?.icon = "icon";
        user8?.companyName = "公司名字";
        user8?.uuid = NSUUID().uuidString
        let user9 = User.mr_createEntity();
        user9?.name = "ff";
        user9?.icon = "icon";
        user9?.companyName = "公司名字";
        user9?.uuid = NSUUID().uuidString
        
        let group4 = UserGroup.mr_createEntity();
        group4?.groupString = "E";
        group4?.groupItem = [user8!, user9!];
        
        let user10 = User.mr_createEntity();
        user10?.name = "10";
        user10?.icon = "icon";
        user10?.companyName = "公司名字";
        user10?.uuid = NSUUID().uuidString
        let user11 = User.mr_createEntity();
        user11?.name = "11";
        user11?.icon = "icon";
        user11?.companyName = "公司名字";
        user11?.uuid = NSUUID().uuidString
        let user12 = User.mr_createEntity();
        user12?.name = "12";
        user12?.icon = "icon";
        user12?.companyName = "公司名字";
        user12?.uuid = NSUUID().uuidString
        let group5 = UserGroup.mr_createEntity();
        group5?.groupString = "F";
        group5?.groupItem = [user10!, user11!, user12!];
        
        
        let last1 = LastContact.mr_createEntity();
        last1?.contactType = ContactType.QQ;
        last1?.lastContactTime = String(Date().timeIntervalSince1970);
        last1?.uuid = user9?.uuid;
        last1?.name = user9?.name;
        
        let last2 = LastContact.mr_createEntity();
        last2?.contactType = ContactType.Phone;
        last2?.lastContactTime = String(Date().timeIntervalSince1970);
        last2?.uuid = user3?.uuid;
        last2?.name = user3?.name;
        
        let last3 = LastContact.mr_createEntity();
        last3?.contactType = ContactType.FaceToFace;
        last3?.lastContactTime = String(Date().timeIntervalSince1970);
        last3?.uuid = user2?.uuid;
        last3?.name = user2?.name;
        
        let last4 = LastContact.mr_createEntity();
        last4?.contactType = ContactType.QQ;
        last4?.lastContactTime = String(Date().timeIntervalSince1970);
        last4?.uuid = user5?.uuid;
        last4?.name = user5?.name;
        
        let last5 = LastContact.mr_createEntity();
        last5?.contactType = ContactType.Message;
        last5?.lastContactTime = String(Date().timeIntervalSince1970);
        last5?.uuid = user11?.uuid;
        last5?.name = user11?.name;
        let last6 = LastContact.mr_createEntity();
        last6?.contactType = ContactType.FaceToFace;
        last6?.lastContactTime = String(Date().timeIntervalSince1970);
        last6?.uuid = user12?.uuid;
        last6?.name = user12?.name;
        
        NSManagedObjectContext.mr_default().mr_save(blockAndWait: { (cxt) in
            print("保存完成");
        })

       
    }
}

