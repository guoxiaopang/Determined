//
//  YXHomeDetailViewController.swift
//  Determined
//
//  Created by duoyi on 16/11/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

let onecell : String = "cell1";
let twocell : String = "cell2";

class YXHomeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, YXHomeDetailHeadViewDelegate
{
    var person : Person?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dataManager.requestData();
        self.view.backgroundColor = UIColor.white;
        self.view.addSubview(tableView);
       

    }

    private lazy var tableView : UITableView = {
        let rect : CGRect = CGRect(x: 0, y: 0, width: 375, height: self.view.frame.height);
        let tableView = UITableView.init(frame: rect, style: UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.register(YXHomeDetailPersonCell.classForCoder() , forCellReuseIdentifier: onecell);
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: twocell);
        tableView.tableHeaderView = self.detailHeadView;
        return tableView;
    }();
    
    private lazy var detailHeadView : YXHomeDetailHeadView = {
        let headView : YXHomeDetailHeadView = YXHomeDetailHeadView();
        headView.frame = CGRect(x: 0, y: 0, width: 375, height: 110);
        headView.delegate = self;
        return headView;
    }();
    
    private lazy var dataManager : YXHomeDetailDataManager = {
        let dataManager = YXHomeDetailDataManager();
        return dataManager;
    }();

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return dataManager.numofSectionOne();
     
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

            let cell : YXHomeDetailPersonCell = tableView.dequeueReusableCell(withIdentifier: onecell) as! YXHomeDetailPersonCell;
            let model = dataManager.personModelWithIndex(index: indexPath.row);
            cell.reloadData(model: model);
            return cell;

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "基础信息";
        }
        return "记录信息";
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    func postModel(model : Person) -> Void
    {
        person = model;
        detailHeadView.loadData(model: model);
    }
    
    func clickDetail(headView: YXHomeDetailHeadView) {
        
        let controller : YXHomeInfoViewController = YXHomeInfoViewController();
        controller.hidesBottomBarWhenPushed = true;
        navigationController?.pushViewController(controller, animated: true);
    }
}
