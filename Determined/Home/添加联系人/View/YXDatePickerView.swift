//
//  YXDatePickerView.swift
//  Determined
//
//  Created by duoyi on 16/12/8.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

typealias sendValue = (_ value : String) -> Void;

class YXDatePickerView: UIView
{
//    var tempStr : String?;
    var sendValue : sendValue!;
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.alpha = 0;
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.5);
        self.frame = UIScreen.main.bounds;
        self.addSubview(bottomView);
        bottomView.addSubview(cancelButton);
        bottomView.addSubview(finishButton);
        bottomView.addSubview(datePicker);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tempStr : String = {
        let date = Date();
        let fmt = DateFormatter();
        fmt.dateFormat = "yyyy年MM月dd日";
        return fmt.string(from: date);
    }()

    // 取消按钮
    lazy var cancelButton : UIButton = {
        let cancelButton = UIButton();
        cancelButton.setTitle("取消", for: UIControlState.normal);
        cancelButton.setTitleColor(self.tintColor, for: UIControlState.normal);
        cancelButton.addTarget(self, action: #selector(closeView), for: UIControlEvents.touchUpInside);
        return cancelButton;
    }()
    
    // 完成按钮
    lazy var finishButton : UIButton = {
        let finishButton = UIButton();
        finishButton.setTitle("完成", for: UIControlState.normal);
        finishButton.setTitleColor(self.tintColor, for: UIControlState.normal);
        finishButton.addTarget(self, action: #selector(done), for: UIControlEvents.touchUpInside);
        return finishButton;
    }()
    
    lazy var bottomView : UIView = {
        let view = UIView();
        view.backgroundColor = UIColor.white;
        view.layer.cornerRadius = 5;
        view.clipsToBounds = true;
        view.alpha = 0;
        return view;
    }()
    
    lazy var datePicker : UIDatePicker = {
        let datePicker = UIDatePicker();
        datePicker.datePickerMode = UIDatePickerMode.date;
        datePicker.locale = Locale.init(identifier: "zh");
        datePicker.maximumDate = Date();
        datePicker.addTarget(self, action: #selector(dateChange), for: UIControlEvents.valueChanged);
        return datePicker;
    }()
    
    // 显示
    func show()
    {
        datePicker.date = Date();
        let window = UIApplication.shared.keyWindow;
        window?.addSubview(self);
        UIView.animate(withDuration: 0.25, animations: {()
            self.alpha = 1;
            self.bottomView.alpha = 1;
        })
    }
    
    // 取消
    func closeView()
    {
        self.alpha = 0;
        self.bottomView.alpha = 0;
        self.removeFromSuperview();
    }
    
    // 完成
    func done()
    {
        // 传输数据 关闭视图
        sendValue(tempStr);
        self.closeView();
    }
    
    // 日期改变
    func dateChange(picker : UIDatePicker)
    {
        let fmt = DateFormatter();
        fmt.dateFormat = "yyyy年MM月dd日";
        let str = fmt.string(from: picker.date);
        tempStr = str;
    }
    
    func addLayout()
    {
        bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.equalTo(240);
            make.center.equalTo(self);
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(bottomView).offset(10);
            make.top.equalTo(bottomView).offset(10);
        }
        
        finishButton.snp.makeConstraints { (make) in
            make.right.equalTo(bottomView).offset(-10);
            make.centerY.equalTo(cancelButton);
        }
        
        datePicker.snp.makeConstraints { (make) in
            make.top.equalTo(cancelButton.snp.bottom);
            make.left.right.bottom.equalTo(bottomView);
        }
    }

}
