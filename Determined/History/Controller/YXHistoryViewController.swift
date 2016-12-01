//
//  YXHistoryViewController.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXHistoryViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let p = People();
        p.name = "天蓝";
        print(p.name);
    }

}

class People
{
    var name : String = ""
    {
        willSet
        {
            print("名字将要设置 \(name)");
        }
        
        didSet
        {
            print("名字已经设置完 \(name)");
        }
    }
}
