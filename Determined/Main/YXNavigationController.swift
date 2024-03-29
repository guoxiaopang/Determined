//
//  YXNavigationController.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SideMenu

class YXNavigationController: UINavigationController
{
    override func viewDidLoad()
    {
        // 设置背景色
        let bar = UINavigationBar.appearance();
        bar.setBackgroundImage(#imageLiteral(resourceName: "navagationBar"), for: UIBarMetrics.default)
        
        // 设置文字属性
        bar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20),
                                   NSForegroundColorAttributeName : UIColor.white];
        
        self.interactivePopGestureRecognizer?.delegate = nil;
    
        
        // 设置状态栏颜色
        let view : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView;
        let statuBar : UIView = view.value(forKey: "statusBar") as! UIView;
        statuBar.backgroundColor = UIColor.init(hex6: 0x4e6cef);
    }
    
    // 这里修改返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if childViewControllers.count >= 1
        {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button);
        }
        super.pushViewController(viewController, animated: true);
    }
    
    private lazy var button:UIButton = {
        let button = UIButton.init(type: UIButtonType.custom);
        button.setImage(#imageLiteral(resourceName: "backButton"), for: UIControlState.normal);
        button.addTarget(self, action: #selector(backViewController), for: UIControlEvents.touchUpInside);
        button.sizeToFit();
        return button;
    }()
    
    func backViewController()
    {
        self.popViewController(animated: true);
    }
}


