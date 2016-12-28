//
//  YXDetailViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/22.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

let detailCellIdent = "detailCellIdent";
class YXDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white;
        view.addSubview(tableView);
    }

    private lazy var tableView : UITableView = {
        let rect : CGRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height);
        let tableView = UITableView.init(frame: rect, style: UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
        
        tableView.showsVerticalScrollIndicator = false;
        tableView.register(YXHomeDetailTableViewCell.classForCoder(), forCellReuseIdentifier: detailCellIdent);
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
//        tableView.tableHeaderView = self.headView;
        tableView.tableFooterView = UIView();
        return tableView;
    }();

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5;
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: detailCellIdent);
        cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        return cell!;
    }

}
