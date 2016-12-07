//
//  YXNavigationController.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

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
    }
    
    

}


