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
        
        dataManager.requestData();
        

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
        return dataManager.rowOfSection(section);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.numOfSection();
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! YXHomeTableViewCell;
        let user = dataManager.modelWithIndexPath(indexPath: indexPath);
        cell .reloadData(user: user!);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailController : YXHomeDetailViewController = YXHomeDetailViewController();
        navigationController?.pushViewController(detailController, animated: true);
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    // 返回索引数组
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let array : [String] = dataManager.itemTitle as! Array<String>;
        return array;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "aa";
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "DELETE", handler: { [weak weakSelf = self](UITableViewRowAction, IndexPath) in
            let user = weakSelf?.dataManager.modelWithIndexPath(indexPath: indexPath);
            let group : UserGroup =  (weakSelf?.dataManager.remove(user: user!))!;
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic);
            if group.groupItem?.count == 0
            {
                // 组成员为0 删除组 删除title
                weakSelf?.dataManager.deleteSection(group: group);
                tableView.deleteSections(IndexSet.init(integer: indexPath.section), with: UITableViewRowAnimation.automatic);
            }
            
            
        })
        deleteAction.backgroundColor = UIColor(hex6: 0xe74c3c)
        return [deleteAction];
    }
}
