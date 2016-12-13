//
//  YXHomeViewController.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import ObjectMapper
import UIColor_Hex_Swift
import SideMenu

class YXHomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, YXHomeDataManagerDelegate
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        self.view.addSubview(tableView);
        
        navigationItem.rightBarButtonItem = rightButton;
        tableView.addSubview(refreshControl);
        
        navigationItem.leftBarButtonItem = leftButton;
        
        navigationItem.leftBarButtonItem = leftButton;
        
        let controller = YXMenuViewController.share;
        controller.view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width * 0.7, height: self.view.frame.size.height);
        let menuLeftNavigationController = UISideMenuNavigationController.init(rootViewController: controller);
        menuLeftNavigationController.leftSide = true;
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController;
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.menuFadeStatusBar = false;
        SideMenuManager.menuWidth = controller.view.frame.width;

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent;
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        dataManager.requestData();
    }
    
// MARK: - 懒加载
    
    private lazy var leftButton : UIBarButtonItem = {
        let leftButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showLeft));
        return leftButton;
    }()
    
    private lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl();
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        return refreshControl;
    }()
    
    private lazy var tableView : UITableView =
    {
        let tableView = UITableView();
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 49 - 64);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.sectionIndexColor = UIColor.init(hex6: 0x7f8c8d);
        tableView.register(YXHomeTableViewCell.classForCoder() , forCellReuseIdentifier: "cell");
        tableView.sectionHeaderHeight = 0;
        tableView.sectionFooterHeight = 0;
        return tableView;
    }();
    
    private lazy var dataManager : YXHomeDataManager =
    {
        let dataManager : YXHomeDataManager = YXHomeDataManager();
        dataManager.delegate = self;
        return dataManager;
    }()
    
    private lazy var rightButton : UIBarButtonItem = {
        let rightButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "addWhite"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(YXHomeViewController.addValue))
        return rightButton;
    }()
    
// MARK: - UITableViewDelegate,UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataManager.rowOfSection(section);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.numOfSection();
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : YXHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! YXHomeTableViewCell;
        let user = dataManager.modelWithIndexPath(indexPath: indexPath);
        cell.reloadData(user: user!);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailController = YXNewDetailViewController();
        let user = dataManager.modelWithIndexPath(indexPath: indexPath);
        detailController.user = user;
        navigationController?.pushViewController(detailController, animated: true);
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    // 返回索引数组
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let temp : NSArray = dataManager.itemTitle;
        let array : Array = temp as! [String];
        return array;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataManager.itemTitle[section] as? String;
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "DELETE", handler: { [weak weakSelf = self](UITableViewRowAction, IndexPath) in
            let user = weakSelf?.dataManager.modelWithIndexPath(indexPath: indexPath);
            let group : UserGroup =  (weakSelf?.dataManager.remove(user: user!))!;
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic);
            if group.groupItem.count == 0
            {
                // 组成员为0 删除组 删除title
                weakSelf?.dataManager.deleteSection(group: group);
                tableView.deleteSections(IndexSet.init(integer: indexPath.section), with: UITableViewRowAnimation.automatic);
            }
            
        })
        deleteAction.backgroundColor = UIColor(hex6: 0xe74c3c)
        return [deleteAction];
    }
    
    func addValue()
    {
        let controller = YXAddFriendViewController(style: UITableViewStyle.grouped);
        self.present(controller, animated: true, completion: nil);

    }
    
    // 下拉刷新
    func refresh()
    {
        dataManager.requestData();
    }
    
    func showLeft()
    {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil);
    }
    
    // MARK: - YXHomeDataManagerDelegate
    func loadDataSuccess(dataManager: YXHomeDataManager)
    {
        self.tableView.reloadData();
        refreshControl.endRefreshing();
    }
}
