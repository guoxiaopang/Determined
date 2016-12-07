//
//  YXAddFriendViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

let YXAddFriendViewCellIdent = "YXAddFriendViewCellIdent";

class YXAddFriendViewController: UITableViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.setTableView();
//        self.view.addSubview(tableView)
    }
    
    func setTableView()
    {
        let rect : CGRect = CGRect(x: 5, y: 0, width: self.view.frame.width - 10, height: self.view.frame.height - 49 - 64);
        tableView.frame = rect;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 55.0;
        //tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendViewCellIdent);
        tableView.sectionHeaderHeight = 10;
        tableView.sectionFooterHeight = 0;
        tableView.backgroundColor = UIColor.white;
        tableView.showsVerticalScrollIndicator = false;
        tableView.tableHeaderView = headView;
    }
    
    private lazy var headView : YXAddFriendHeadView = {
        let view = YXAddFriendHeadView();
        view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 200);
        return view;
    }()

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 1;
        }
        else if section == 1
        {
            return 4;
        }
        else
        {
            return 1;
        }
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3;
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendViewCellIdent)!;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        return cell;
    }

}
