//
//  YXTextView.swift
//  Determined
//
//  Created by duoyi on 16/12/8.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXTextView: UITextView
{
    
    var placeholderLabel : UILabel?;
    var placeholder : String?;
    
    override init(frame: CGRect, textContainer: NSTextContainer?)
    {
        super.init(frame: frame, textContainer: textContainer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textChange), name: .UITextViewTextDidChange , object: nil);
 
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textChange(notification : NSNotification)
    {
        if self.placeholder?.characters.count == 0
        {
            return;
        }
        UIView.animate(withDuration: 0.1, animations: {()
            self.showOrHide();
        })
    }
    
    func showOrHide()
    {
        if self.text.characters.count < 1
        {
            self.placeholderLabel?.alpha = 1;
        }
        else
        {
            self.placeholderLabel?.alpha = 0;
        }
    }
    
    override func draw(_ rect: CGRect)
    {
        // 如果文字消失了就绘制placeholder
        super.draw(rect);
        if (placeholder?.characters.count)! > 0
        {
            placeholderLabel?.removeFromSuperview();
            
            let linePadding : CGFloat = 14.0;
            let width = rect.size.width - 2 * linePadding;
            let height = rect.size.height - 2 * linePadding;
            
            let placeholderRect = CGRect.init(x: linePadding,
                                              y: linePadding,
                                              width: width,
                                              height: height);
            placeholderLabel = UILabel.init(frame: placeholderRect);
            placeholderLabel?.font = self.font;
            placeholderLabel?.textAlignment = self.textAlignment;
            placeholderLabel?.textColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2);
            placeholderLabel?.backgroundColor = self.backgroundColor;
            self.addSubview(placeholderLabel!);
            placeholderLabel?.text = placeholder;
            placeholderLabel?.sizeToFit();
            showOrHide();
        }
    }
    
//    override var textContainerInset: UIEdgeInsets
//    {
//        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10);
//    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews();
        if self.placeholder?.characters.count != 0 && !(self.placeholderLabel != nil)
        {
            self.setNeedsDisplay();
        }
    }
    
    override var insertDictationResultPlaceholder: Any
    {
        return "aaa";
    }
    
    
}
