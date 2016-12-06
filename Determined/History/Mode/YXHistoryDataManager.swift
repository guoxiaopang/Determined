//
//  YXHistoryDataManager.swift
//  Determined
//
//  Created by duoyi on 16/12/6.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXHistoryDataManager: NSObject
{
    func requestData()
    {
        let array = User.mr_findAll();
        print(array ?? 1);
    }
}
