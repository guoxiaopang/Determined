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
        return 2;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! YXHomeTableViewCell;
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
//            let person : YXPersonInfo = weakSelf!.dataManager.modelWithIndex(index: indexPath);
//            weakSelf?.dataManager.removeModel(model: person);
//            tableView.deleteSections(IndexSet.init(integer: indexPath.section), with: UITableViewRowAnimation.automatic);
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic);
        })
        deleteAction.backgroundColor = UIColor(hex6: 0xe74c3c)
        return [deleteAction];
    }
}
