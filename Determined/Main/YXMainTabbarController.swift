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
    var tabbar : YXTabBar?;
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.addController(YXHistoryViewController(), "historyNormal", "history", "历史");
        self.addController(YXHomeViewController(), "homeNormal", "home", "联系人");
        
        tabbar = YXTabBar()
        tabbar?.dele = self;
        self.setValue(tabbar, forKey: "tabBar")
        tabbar?.backgroundImage = UIImage(named : "tabbar_background");
        
       
    }

    private func addController(_ controller : UIViewController,_ imageName : String,_ hightImageName: String,_ title : String) -> Void
    {
        let navigation : YXNavigationController = YXNavigationController(rootViewController : controller);
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

    }

    
}
