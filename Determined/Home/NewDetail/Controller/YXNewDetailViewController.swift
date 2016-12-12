//
//  YXNewDetailViewController.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

let newDetailCellIdent = "newDetailCellIdent";

class YXNewDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, YXNewDetailHeadViewDelegate
{
    var user : User?;
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addSubview(tableView);
        self.view.backgroundColor = UIColor.white;
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0);
        dataManager.requestData(user: user!);
        headView.reloadData(user: user!);
    }
    
    
    override var prefersStatusBarHidden: Bool
    {
        return true;
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated);
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    private lazy var dataManager : YXHomeNewDetailDataManager = {
        let manager = YXHomeNewDetailDataManager();
        return manager;
    }()

    private lazy var tableView : UITableView = {
        let rect : CGRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height);
        let tableView = UITableView.init(frame: rect, style: UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;

        tableView.showsVerticalScrollIndicator = false;
        tableView.register(YXNewDetailTableViewCell.classForCoder(), forCellReuseIdentifier: newDetailCellIdent);
        tableView.tableHeaderView = self.headView;
        tableView.tableFooterView = UIView();
        return tableView;
    }();
    
    private lazy var headView : YXNewDetailHeadView = {
        let headView = YXNewDetailHeadView();
        headView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 280);
        headView.delegate = self;
        return headView;
    }()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (user?.basicInformation.count)!;
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXNewDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: newDetailCellIdent) as! YXNewDetailTableViewCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        let info : BasicInfo = user?.basicInformation[indexPath.row] as! BasicInfo;
        cell.reloadData(info);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Contact Information";
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 44;
    }

    // MARK: - YXNewDetailHeadViewDelegate
    func clickBack(_ headView: YXNewDetailHeadView)
    {
        let _ = navigationController?.popViewController(animated: true);
    }

}
