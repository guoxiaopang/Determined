//
//  YXAddFriendViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import Photos

enum SelectType
{
    case camera;
    case photoLibrary;
}

let YXAddFriendViewCellIdent = "YXAddFriendViewCellIdent";
let YXAddFriendOneTableViewCellIdent = "YXAddFriendOneTableViewCellIdent";
let YXAddFriendTwoTableViewCellIdent = "YXAddFriendTwoTableViewCellIdent";
let YXAddFriendThreeTableViewCellIdent = "YXAddFriendThreeTableViewCellIdent";
let YXAddFriendRemarkTableViewCellIdent = "YXAddFriendRemarkTableViewCellIdent";
let YXAddFriendBirthdayTableViewCellIdent = "YXAddFriendBirthdayTableViewCellIdent";
let YXAddHometownTableViewCellIdent = "YXAddHometownTableViewCellIdent";

class YXAddFriendViewController: UITableViewController, YXAddFriendHeadViewDelegate, YXAddFriendThreeTableViewCellDelegate, YXAddFriendDataManagerDelegate, YXAddFriendOneTableViewCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var name : String = "";
    var phoneNum : String = "";
    var imagePath : String = "";
    var birthday : String = "";
    var homeTown : String = "";
    var remark : String = "";
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.setTableView();
        let tap = UITapGestureRecognizer();
        tap.addTarget(self, action: #selector(YXAddFriendViewController.closeKeyboard));
        self.view.addGestureRecognizer(tap);
    }
    
    func setTableView()
    {
        let rect : CGRect = CGRect(x: 5, y: 0, width: self.view.frame.width - 10, height: self.view.frame.height - 49 - 64);
        tableView.frame = rect;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 55.0;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.sectionHeaderHeight = 10;
        tableView.sectionFooterHeight = 0;
        tableView.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        tableView.showsVerticalScrollIndicator = false;
        tableView.tableHeaderView = headView;
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendViewCellIdent);
        tableView.register(YXAddFriendOneTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendOneTableViewCellIdent);
        tableView.register(YXAddFriendThreeTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendThreeTableViewCellIdent);
        tableView.register(YXAddFriendRemarkTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendRemarkTableViewCellIdent);
        tableView.register(YXAddFriendBirthdayTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendBirthdayTableViewCellIdent);
        tableView.register(YXAddHometownTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddHometownTableViewCellIdent);
    }
    
    //MARK: - 懒加载
    
    private lazy var headView : YXAddFriendHeadView = {
        let view = YXAddFriendHeadView();
        view.delegate = self;
        view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 200);
        return view;
    }()
    
    private lazy var dataManager : YXAddFriendDataManager = {
        let dataManager = YXAddFriendDataManager();
        dataManager.delegate = self;
        return dataManager;
    }()

    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1
        {
            return 2;
        }
        return 1;
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 4;
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
            let cell : YXAddFriendOneTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendOneTableViewCellIdent)! as! YXAddFriendOneTableViewCell;
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            cell.reloadData(name, phoneNum, imagePath)
            cell.one = {[weak weakSlef = self](_ name : String, _ phoneNumber : String, _ imagePath : String) in
                weakSlef?.name = name;
                weakSlef?.phoneNum = phoneNumber;
                //weakSlef?.imagePath = imagePath;
               // 昨天写到这里
            }
            return cell;
        }
        else if indexPath.section == 1
        {
            if indexPath.row == 0
            {
                let cell : YXAddFriendBirthdayTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendBirthdayTableViewCellIdent) as! YXAddFriendBirthdayTableViewCell;
                cell.titleField.text = birthday;
                cell.bt = {[weak weakSlef = self] (_ birthdayValue : String) in
                    weakSlef?.birthday = birthdayValue;
                }
                return cell;
            }
            else
            {
                let cell : YXAddHometownTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddHometownTableViewCellIdent) as! YXAddHometownTableViewCell;
                cell.titleField.text = homeTown;
                cell.ht = {[weak weakSlef = self](_ homeValue : String) in
                    weakSlef?.homeTown = homeValue;
                }
                cell.selectionStyle = UITableViewCellSelectionStyle.none;
                return cell;
            }
            
        }
        else if indexPath.section == 2
        {
            let cell : YXAddFriendRemarkTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendRemarkTableViewCellIdent) as! YXAddFriendRemarkTableViewCell;
            cell.textView.text = remark;
            cell.rm = {[weak weakSlef = self] (_ homeValue : String) in
                weakSlef?.remark = homeValue;
            }
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
        else
        {
            let cell : YXAddFriendThreeTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendThreeTableViewCellIdent)! as! YXAddFriendThreeTableViewCell;
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
    }
    
    //MARK: - YXAddFriendHeadViewDelegate
    func dissMiss(headView: YXAddFriendHeadView)
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    // MARK: - Void
    func closeKeyboard()
    {
        self.view.endEditing(true);
    }
    
    func submit(cell: YXAddFriendThreeTableViewCell)
    {
        dataManager.addUser(imagePath, name, phoneNum, birthday, homeTown, remark);
    }
    
    // MARK: - YXAddFriendDataManagerDelegate
    func addUserSuccess(dataManager: YXAddFriendDataManager)
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    // MARK: - YXAddFriendOneTableViewCellDelegate
    private lazy var alertView : UIAlertController = {
        let alertView = UIAlertController.init(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet);
        let action1 = UIAlertAction.init(title: "拍照", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction) in
            self.showType(type: SelectType.camera);
        })
        
        alertView.addAction(action1);
        let action2 = UIAlertAction.init(title: "相册选择照片", style: UIAlertActionStyle.default, handler: { (action : UIAlertAction) in
            self.showType(type: SelectType.photoLibrary);
        })
        
        alertView.addAction(action2);
        let action3 = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.destructive, handler: { (action : UIAlertAction) in
           
        })
        
        alertView.addAction(action3);
        
        return alertView;
    }()
    
    // 弹出选择框
    func selectedPhoto(_ cell: YXAddFriendOneTableViewCell)
    {
        self.present(alertView, animated: true, completion: nil);
    }
    
    
    // 判断权限
    func showType(type : SelectType)
    {
        let status : PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus();
        if status == PHAuthorizationStatus.restricted || status == PHAuthorizationStatus.denied
        {
            print("没有权限");
            let alertView = UIAlertController.init(title: nil, message: "请在设置->隐私->相机中允许访问你的相机", preferredStyle: UIAlertControllerStyle.alert);
            let action = UIAlertAction.init(title: "好的", style: UIAlertActionStyle.default, handler: nil)
            alertView.addAction(action);
            self.present(alertView, animated: true, completion: nil);
            return;
        }
        
        let imagePickController = UIImagePickerController();
        imagePickController.delegate = self;
        if type == SelectType.camera
        {
            imagePickController.sourceType = UIImagePickerControllerSourceType.camera;
        }
        else if type == SelectType.photoLibrary
        {
            imagePickController.sourceType = UIImagePickerControllerSourceType.photoLibrary;
        }
        self.present(imagePickController, animated: true, completion: nil);
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let image : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage;
        let manager = YXFileManager.share;
        let path = manager.saveImage(image: image, name: nil);
        imagePath = path;
        
        picker.dismiss(animated: true, completion: nil);
        tableView.reloadRows(at: [IndexPath.init(row: 0, section: 0)], with: UITableViewRowAnimation.automatic)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil);
    }
}
