//
//  YXHomeDataManager.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import Alamofire

class YXHomeDataManager: NSObject
{
    
    func request() -> Void
    {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            
            switch response.result
            {
            case.success( _):
                print("success");
                break;
            case.failure( _):
                print("faild");
                break;
            }
        }
        
       
    }
}
