//
//  YXTextField.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXTextField: UITextField
{

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect
    {
        let inset = CGRect.init(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width-10, height: bounds.size.height);
        return inset;
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        let inset = CGRect.init(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width-10, height: bounds.size.height);
        return inset;
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect
    {
        let inset = CGRect.init(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width-10, height: bounds.size.height);
        return inset;
    }

}
