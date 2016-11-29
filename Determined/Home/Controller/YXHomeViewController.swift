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
        tableView.register(YXHomeTableViewCell.classForCoder() , forCellReuseIdentifier: "cell");
        return tableView;
    }();

    private lazy var item : [Int] =
    {
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 ,20 ,21, 22, 23];
        return array;
    }();
    
    private lazy var dataManager : YXHomeDataManager =
    {
        let dataManager : YXHomeDataManager = YXHomeDataManager();
        return dataManager;
    }()
    
    // MARK: - UITableViewDelegate,UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return item.count;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! YXHomeTableViewCell;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView .deselectRow(at: indexPath, animated: true);
    }
}
