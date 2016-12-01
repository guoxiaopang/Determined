//
//  YXHomeInfoViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/1.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

let infoCellIdent : String = "infoCellIdent";

class YXHomeInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
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
        tableView.register(YXHomeDetailTextCell.classForCoder(), forCellReuseIdentifier: infoCellIdent);
        tableView.sectionHeaderHeight = 0;
       // tableView.sectionFooterHeight = 0;
        return tableView;
    }();


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5 ;
    }

    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXHomeDetailTextCell = tableView.dequeueReusableCell(withIdentifier: infoCellIdent) as! YXHomeDetailTextCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        return cell;
    }
    
    


}
