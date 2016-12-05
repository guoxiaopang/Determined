//
//  YXHomeViewController.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import ObjectMapper

class YXHomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        self.view.addSubview(tableView);
        
        dataManager.request();
        
        let test = YXCoreDataManager.shareManager();
 
        for item in test.selected()
        {
            let p = item as! PersonData;
            test.deleteData(personData: p);
        }
    
        // 添加新的
        let dict1 = ["name" : "天蓝", "icon" : "icon", "age" : "22", "companyName" : "杭州阿里巴巴"] as [String : Any];
        let dict2 = ["name" : "天黑", "icon" : "icon", "age" : "33", "companyName" : "北京XXX"] as [String : Any];
        let dict3 = ["name" : "小明", "icon" : "icon", "age" : "31", "companyName" : "云南xxx"] as [String : Any];
        let dict4 = ["name" : "小白", "icon" : "icon", "age" : "30", "companyName" : "重庆猪八戒网"] as [String : Any];
        let dict5 = ["name" : "小黑", "icon" : "icon", "age" : "18", "companyName" : "北京XXX"] as [String : Any];
        let dict6 = ["name" : "习大大", "icon" : "icon", "age" : "12", "companyName" : "杭州北京XXX"] as [String : Any];
        let dict7 = ["name" : "包子", "icon" : "icon", "age" : "45", "companyName" : "杭州北京XXX"] as [String : Any];
        let dict8 = ["name" : "面包", "icon" : "icon", "age" : "40", "companyName" : "北京XXX阿里巴巴"] as [String : Any];
        let dict9 = ["name" : "篮子", "icon" : "icon", "age" : "50", "companyName" : "杭州北京XXX"] as [String : Any];
        let dict10 = ["name" : "呆呆", "icon" : "icon", "age" : "31", "companyName" : "北京XXX阿里巴巴"] as [String : Any];
        let dict11 = ["name" : "萌萌", "icon" : "icon", "age" : "32", "companyName" : "北京XXX阿里巴巴"] as [String : Any];
        let dict12 = ["name" : "甜甜", "icon" : "icon", "age" : "33", "companyName" : "北京XXX阿里巴巴"] as [String : Any];
        let dict13 = ["name" : "傻傻", "icon" : "icon", "age" : "34", "companyName" : "北京XXX阿里巴巴"] as [String : Any];
        let dict14 = ["name" : "张全蛋", "icon" : "icon", "age" : "38", "companyName" : "北京XXX阿里巴巴"] as [String : Any];
        let dict15 = ["name" : "王尼玛", "icon" : "icon", "age" : "31", "companyName" : "杭州北京XXX"] as [String : Any];

        test.insert("1", dict1 as NSDictionary);
        test.insert("2", dict2 as NSDictionary);
        test.insert("3", dict3 as NSDictionary);
        test.insert("4", dict4 as NSDictionary);
        test.insert("5", dict5 as NSDictionary);
        test.insert("6", dict6 as NSDictionary);
        test.insert("7", dict7 as NSDictionary);
        test.insert("8", dict8 as NSDictionary);
        test.insert("9", dict9 as NSDictionary);
        test.insert("10", dict10 as NSDictionary);
        test.insert("11", dict11 as NSDictionary);
        test.insert("12", dict12 as NSDictionary);
        test.insert("13", dict13 as NSDictionary);
        test.insert("14", dict14 as NSDictionary);
        test.insert("15", dict15 as NSDictionary);
    }

    private lazy var tableView : UITableView =
    {
        let tableView = UITableView();
        tableView.frame = CGRect(x: 0, y: 0, width: 375, height: self.view.frame.height);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.sectionIndexColor = UIColor.init(hex6: 0x888888);
        tableView.register(YXHomeTableViewCell.classForCoder() , forCellReuseIdentifier: "cell");
        return tableView;
    }();
    
    private lazy var dataManager : YXHomeDataManager =
    {
        let dataManager : YXHomeDataManager = YXHomeDataManager();
        return dataManager;
    }()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataManager.numberOfRow();
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! YXHomeTableViewCell;
        let person : YXPersonInfo = dataManager.modelWithIndex(index: indexPath);
        cell.changeValueWithModel(person: person);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailController : YXHomeDetailViewController = YXHomeDetailViewController();
//        let person : Person = dataManager.modelWithIndex(index: indexPath);
//        detailController.postModel(model: person);
        navigationController?.pushViewController(detailController, animated: true);
//        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    // 返回索引数组
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return dataManager.groupTitle() as? [String];
//    }
//    
    // 返回每个索引内容
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let group : YXHomeModel = dataManager.groupWithSection(section: section);
//        return group.group;
//    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "DELETE", handler: { [weak weakSelf = self](UITableViewRowAction, IndexPath) in
            let person : YXPersonInfo = weakSelf!.dataManager.modelWithIndex(index: indexPath);
            weakSelf?.dataManager.removeModel(model: person);
//            tableView.deleteSections(IndexSet.init(integer: indexPath.section), with: UITableViewRowAnimation.automatic);
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic);
        })
        deleteAction.backgroundColor = UIColor(hex6: 0xe74c3c)
        return [deleteAction];
    }
}
