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
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: YXMenuViewControllerCellIdent);
        tableView.sectionHeaderHeight = 10;
        tableView.sectionFooterHeight = 0;
        tableView.backgroundColor = UIColor.white;
        tableView.rowHeight = 50;
        tableView.showsVerticalScrollIndicator = false;
        tableView.tableHeaderView = self.headView;
        return tableView;
    }();
    
  
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 2;
        }
        else
        {
            return 1;
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: YXMenuViewControllerCellIdent);
        cell?.imageView?.image = #imageLiteral(resourceName: "set");
        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
                cell?.textLabel?.text = "历史";
            }
            else if indexPath.row == 1
            {
                cell?.textLabel?.text = "联系人";
            }
        }
        else if (indexPath.section == 1)
        {
            cell?.textLabel?.text = "设置";
        }
        return cell!;
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.section == 0
        {
            if indexPath.row == 1
            {
                self.dismiss(animated: true, completion: ({
                    let homeController = YXHomeViewController();
                    let navigationVC : YXNavigationController = YXNavigationController(rootViewController : homeController);
                    // 切换rootViewController
                    let window = UIApplication.shared.keyWindow;
                    window?.rootViewController = navigationVC;
                }))
            }
            else
            {
                self.dismiss(animated: true, completion: ({
                    let history = YXHistoryViewController();
                    let navigationVC : YXNavigationController = YXNavigationController(rootViewController : history);
                    // 切换rootViewController
                    let window = UIApplication.shared.keyWindow;
                    window?.rootViewController = navigationVC;
                }))
            }
        }
        else
        {
            // 设置
        }

    }

}
