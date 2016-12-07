//
//  YXMainTabbarController.swift
//  Determined
//
//  Created by duoyi on 16/11/28.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXMainTabbarController: UITabBarController, YXTabBarDelegate
{
    
    var history : YXHistoryViewController?;
    var home : YXHomeViewController?;
    var find : YXFindViewController?;
    var me : YXMeViewController?;
    var tabbar : YXTabBar?;
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.addController(YXHistoryViewController(), "historyNormal", "history", "历史");
        self.addController(YXHomeViewController(), "homeNormal", "home", "加");
        
        tabbar = YXTabBar()
        tabbar?.dele = self;
        self.setValue(tabbar, forKey: "tabBar")
        tabbar?.backgroundImage = UIImage(named : "tabbar_background");
        
       
    }

    private func addController(_ controller : UIViewController,_ imageName : String,_ hightImageName: String,_ title : String) -> Void
    {
        let navigation : UINavigationController = UINavigationController(rootViewController : controller);
        controller.tabBarItem.image = UIImage(named: imageName);
        controller.tabBarItem.selectedImage = UIImage(named : hightImageName);
        controller.navigationItem.title = title;
        controller.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
        navigation.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.red], for: UIControlState.highlighted)
        self.addChildViewController(navigation)
    }
    
    func click(tabbar: YXTabBar)
    {
       // 新增 还是 修改
        
//        let alertController = UIAlertController(title: nil, message: "", preferredStyle: UIAlertControllerStyle.actionSheet);
//        let newAction = UIAlertAction.init(title: "添加联系人", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction) in
//            
//            print("新增");
//        })
//        alertController.addAction(newAction);
//        let changeAction = UIAlertAction.init(title: "修改联系人", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction) in
//            print("修改");
//        })
//        alertController.addAction(changeAction);
//        let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: {(action : UIAlertAction) in
//            print("取消");
//        })
//        alertController.addAction(cancelAction);
//        self.present(alertController, animated: true, completion: nil);
//        let controller = YXAddViewController();
//        self.present(controller, animated: true, completion: nil);
    }
    
//    func addValue()
//    {
//        let user = User.mr_createEntity();
//        user?.name = self.randomString(length: 3);
//        user?.icon = "icon";
//        user?.companyName = self.randomString(length: 10);
//        let (number, type) = dataManager.addModel(user: user!);
//        if type == "row"
//        {
//            tableView.insertRows(at: [IndexPath(row: 0, section: number)], with: UITableViewRowAnimation.automatic);
//        }
//        else
//        {
//            tableView.insertSections(IndexSet.init(integer: number), with: UITableViewRowAnimation.automatic)
//        }
//    }
//    
//    func randomString(length:Int) -> String
//    {
//        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
//        var c = charSet.characters.map { String($0) }
//        var s:String = ""
//        for _ in (1...length)
//        {
//            let temp = Int(arc4random())%(c.count);
//            s.append(c[temp])
//        }
//        return s
//    }
    
}
