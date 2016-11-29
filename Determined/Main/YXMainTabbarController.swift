//
//  YXMainTabbarController.swift
//  Determined
//
//  Created by duoyi on 16/11/28.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXMainTabbarController: UITabBarController
{
    
    var history : YXHistoryViewController?;
    var home : YXHomeViewController?;
    var find : YXFindViewController?;
    var me : YXMeViewController?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.addController(YXHistoryViewController(), "historyNormal", "history", "历史");
        self.addController(YXHomeViewController(), "homeNormal", "home", "朋友");
        self.addController(YXFindViewController(), "findNormal", "find", "发现");
        self.addController(YXMeViewController(), "meNormal", "me", "我的");
        self.changeTabbar();
    }

    private func addController(_ controller : UIViewController,_ imageName : String,_ hightImageName: String,_ title : String) -> Void
    {
        let navigation : UINavigationController = UINavigationController(rootViewController : controller);
        controller.tabBarItem.image = UIImage(named: imageName);
        controller.tabBarItem.selectedImage = UIImage(named : hightImageName);
        controller.navigationItem.title = title;
        controller.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        navigation.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.red], for: UIControlState.highlighted)
        self.addChildViewController(navigation)
    }
    
    func changeTabbar() -> Void
    {
        let tabbar : UITabBar = UITabBar.appearance();
        tabbar.isTranslucent = true;
    }
}
