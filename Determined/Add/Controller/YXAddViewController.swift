//
//  YXAddViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/6.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXAddViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
       
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.dismiss(animated: true, completion: nil);
    }
}
