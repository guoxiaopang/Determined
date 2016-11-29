//
//  HEX.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    func colorWithHex(_ color : NSInteger, _ alpha : Float) -> UIColor
    {
        let r : NSInteger = (color & 0xFF0000)>>16;
        let g : NSInteger = (color & 0x00FF00)>>16;
        let b : NSInteger = (color & 0x0000FF)>>16;
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0/255.0, blue: CGFloat(b)/255.0/255.0, alpha: CGFloat(alpha));
    }
    
    func colorWithHex(color : NSInteger) -> UIColor
    {
        return UIColor.gray;//self.colorWithHex(color,1);
    }
}
