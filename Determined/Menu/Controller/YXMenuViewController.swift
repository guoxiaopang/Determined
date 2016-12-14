//
//  YXMenuViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/12.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SideMenu

let YXMenuViewControllerCellIdent = "YXMenuViewControllerCellIdent";

class YXMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    static let share = YXMenuViewController();
    var tempCell : YXMenuTableViewCell?;
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addSubview(tableView);

        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true;
    }

    private lazy var headView : YXMenuHeadView = {
        let headView  = YXMenuHeadView();
        headView.frame = CGRect.init(x: 0, y: 0, width: 100, height: 220);
        return headView;
    }()
    
    private lazy var tableView : UITableView = {
        let rect : CGRect = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.7, height: self.view.frame.height - 49);
        let tableView = UITableView.init(frame: rect, style: UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 55.0;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
        tableView.separatorInset = UIEdgeInsets.zero;
        tableView.register(YXMenuTableViewCell.classForCoder(), forCellReuseIdentifier: YXMenuViewControllerCellIdent);
        tableView.sectionHeaderHeight = 10;
        tableView.sectionFooterHeight = 0;
        tableView.backgroundColor = UIColor.white;
        tableView.showsVerticalScrollIndicator = false;
        tableView.tableHeaderView = self.headView;
        return tableView;
    }();
    
  
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3;
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: YXMenuViewControllerCellIdent) as! YXMenuTableViewCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        if indexPath.row == 0
        {
            cell.reloadData(title: "历史", imageName: "");
        }
        else if indexPath.row == 1
        {
            cell.reloadData(title: "联系人", imageName: "");
        }
        else if (indexPath.row == 2)
        {
            cell.reloadData(title: "设置", imageName: "");
        }
        return cell;
    }

    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell : YXMenuTableViewCell = tableView.cellForRow(at: indexPath) as! YXMenuTableViewCell;
        // 取消历史cell
        tempCell?.changeStatus(false);
        tempCell = cell;
     
        if indexPath.row == 1
        {
            cell.changeStatus(true);
            self.dismiss(animated: true, completion: ({
                let homeController = YXHomeViewController();
                let navigationVC : YXNavigationController = YXNavigationController(rootViewController : homeController);
                // 切换rootViewController
                let window = UIApplication.shared.keyWindow;
                window?.rootViewController = navigationVC;
            }))
        }
        else if indexPath.row == 0
        {
            cell.changeStatus(true);
            self.dismiss(animated: true, completion: ({
                let history = YXHistoryViewController();
                let navigationVC : YXNavigationController = YXNavigationController(rootViewController : history);
                // 切换rootViewController
                let window = UIApplication.shared.keyWindow;
                window?.rootViewController = navigationVC;
            }))
        }
        else
        {
            
        }

//        tableView.deselectRow(at: indexPath, animated: true);

    }

}
