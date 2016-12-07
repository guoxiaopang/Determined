//
//  YXAddFriendViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

let YXAddFriendViewCellIdent = "YXAddFriendViewCellIdent";
let YXAddFriendOneTableViewCellIdent = "YXAddFriendOneTableViewCellIdent";
let YXAddFriendTwoTableViewCellIdent = "YXAddFriendTwoTableViewCellIdent";
let YXAddFriendThreeTableViewCellIdent = "YXAddFriendThreeTableViewCellIdent";

class YXAddFriendViewController: UITableViewController, YXAddFriendHeadViewDelegate
{

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
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendViewCellIdent);
        tableView.register(YXAddFriendOneTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendOneTableViewCellIdent);
        tableView.register(YXAddFriendTwoTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendTwoTableViewCellIdent);
        tableView.register(YXAddFriendThreeTableViewCell.classForCoder(), forCellReuseIdentifier: YXAddFriendThreeTableViewCellIdent);
        tableView.sectionHeaderHeight = 10;
        tableView.sectionFooterHeight = 0;
        tableView.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        tableView.showsVerticalScrollIndicator = false;
        tableView.tableHeaderView = headView;
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
        return dataManager;
    }()

    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 1;
        }
        else if section == 1
        {
            return dataManager.num();
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
        if indexPath.section == 0
        {
            let cell : YXAddFriendOneTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendOneTableViewCellIdent)! as! YXAddFriendOneTableViewCell;
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
        else if indexPath.section == 1
        {
            let cell : YXAddFriendTwoTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendTwoTableViewCellIdent)! as! YXAddFriendTwoTableViewCell;
            let title = dataManager.numofRow(index: indexPath.row);
            cell.changePlaceholder(str: title!);
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
        else if indexPath.section == 2
        {
            let cell : YXAddFriendThreeTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendThreeTableViewCellIdent)! as! YXAddFriendThreeTableViewCell;
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: YXAddFriendViewCellIdent)!;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        return cell;
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
}
