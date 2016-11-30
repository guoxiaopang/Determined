//
//  YXHomeDetailViewController.swift
//  Determined
//
//  Created by duoyi on 16/11/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXHomeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var person : Person?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white;
        self.view.addSubview(tableView);
    }

    private lazy var tableView : UITableView =
        {
            let rect : CGRect = CGRect(x: 0, y: 0, width: 375, height: self.view.frame.height);
            let tableView = UITableView.init(frame: rect, style: UITableViewStyle.grouped);
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.rowHeight = UITableViewAutomaticDimension;
            tableView.estimatedRowHeight = 44.0;
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
            tableView.register(UITableViewCell.classForCoder() , forCellReuseIdentifier: "cell");
            return tableView;
    }();

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!;
        return cell;
    }
    
    func postModel(model : Person) -> Void {
        person = model;
    }
}
