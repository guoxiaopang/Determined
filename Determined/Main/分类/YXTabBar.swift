//
//  YXTabBar.swift
//  Determined
//
//  Created by duoyi on 16/12/6.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

protocol YXTabBarDelegate
{
  func click(tabbar : YXTabBar);
}

class YXTabBar: UITabBar
{
    var subView: UIView?
    var button : UIButton?
    var dele: YXTabBarDelegate?;
    
    override func layoutSubviews()
    {
        super.layoutSubviews();
        let y = 0.0;
        let height = 44.0;
        let width = self.frame.size.width / 3.0;
        self.addButton();
        button?.center = CGPoint(x: self.frame.size.width/2, y: CGFloat(height/2));
        
        for i in 0..<self.subviews.count
        {
            subView = self.subviews[i]
            if self.subviews[i].isKind(of: NSClassFromString("UITabBarButton")!)
            {
                
                if i > 1
                {
                    let x : Double = Double(width) * Double(i)
                    subView?.frame = CGRect(x: x, y: y, width: Double(width), height: height)
                }
                else
                {
                    let x : Double = Double(width) * Double(i - 1)
                    subView?.frame = CGRect(x: x, y: y, width: Double(width), height: height)
                }
            }
        }
    }
    
    private func addButton() -> ()
    {
        self.button = UIButton()
        self.button?.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        self.button?.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        self.button?.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        self.button?.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState.normal)

        self.button?.sizeToFit();
        self.button?.addTarget(self, action:#selector(clickButton), for: UIControlEvents.touchUpInside)
        self.addSubview(self.button!)
    }
    
    func clickButton() -> ()
    {
        self.dele?.click(tabbar : self);
    }
}
