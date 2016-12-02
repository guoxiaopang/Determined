//
//  YXHomeViewController.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXHomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        self.view.addSubview(tableView);
        
        dataManager.request();
        
        let test = YXCoreDataManager.shareManager();
    

        
        test.insert("123", ["name" : "guoyu"]);
        test.insert("234", ["name" : "guoyu"]);
        
        for item in test.selected()
        {
            let p = item as! PersonData;
            print(p.uuid!);
        }
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
    
    // MARK: - UITableViewDelegate,UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return dataManager.numberOfSection();
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataManager.numofRow(section: section);
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! YXHomeTableViewCell;
        let person : Person = dataManager.modelWithIndex(index: indexPath);
        cell.changeValueWithModel(person: person);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailController : YXHomeDetailViewController = YXHomeDetailViewController();
        let person : Person = dataManager.modelWithIndex(index: indexPath);
        detailController.postModel(model: person);
        navigationController?.pushViewController(detailController, animated: true);
//        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    // 返回索引数组
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataManager.groupTitle() as? [String];
    }
    
    // 返回每个索引内容
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group : YXHomeModel = dataManager.groupWithSection(section: section);
        return group.group;
    }
}
