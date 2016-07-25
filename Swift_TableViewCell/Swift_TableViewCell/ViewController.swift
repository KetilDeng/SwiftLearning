//
//  ViewController.swift
//  Swift_TableViewCell
//
//  Created by Kerry on 16/4/16.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var customTableView:UITableView?
    var dataArray:NSMutableArray?
    var arrayOfCharacters:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = NSMutableArray()
        arrayOfCharacters = ["A","B","C","D","E","F"]

        for index in 0...5
        {
            let model:AppsModel = AppsModel()
            model.icon = "user_icon"
            model.name = "你想像不到的星系\(index)"
            model.dec = "即使身边世事在毫无道理即使身边世事在毫无道理即使身边世事在毫无道理"
            dataArray!.addObject(model)
        }
        
        customTableView = UITableView(frame: self.view.bounds, style: .Grouped)
        customTableView!.delegate = self
        customTableView!.dataSource = self
        self.view.addSubview(customTableView!)
        
        let tableViewHeaderView:UIView = UIView(frame:CGRectMake(0, 0, customTableView!.bounds.size.width, 50))
        tableViewHeaderView.backgroundColor = UIColor.greenColor()
        let headerLabel:UILabel = UILabel(frame: tableViewHeaderView.frame)
        headerLabel.font = UIFont.systemFontOfSize(17)
        headerLabel.text = "表头"
        headerLabel.backgroundColor = UIColor.clearColor()
        tableViewHeaderView.addSubview(headerLabel)
        customTableView?.tableHeaderView = tableViewHeaderView
        
        let tableViewFooterView:UIView = UIView(frame:CGRectMake(0, 0, customTableView!.bounds.size.width, 50))
        tableViewFooterView.backgroundColor = UIColor.yellowColor()
        let footerLabel:UILabel = UILabel(frame:tableViewFooterView.frame)
        footerLabel.font = UIFont.systemFontOfSize(17)
        footerLabel.text = "表尾"
        footerLabel.backgroundColor = UIColor.clearColor()
        tableViewFooterView.addSubview(footerLabel)
        customTableView?.tableFooterView = tableViewFooterView
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrayOfCharacters!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID:String = "cellID"
        var cell:CustomCell? = tableView.dequeueReusableCellWithIdentifier(cellID) as? CustomCell
        
        if cell == nil
        {
            cell = CustomCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellID)
            cell!.selectionStyle = .Gray
            cell!.accessoryType = .DisclosureIndicator
        }
        
        if dataArray!.count > indexPath.row
        {
            cell?.showAppInfoWithModel(dataArray!.objectAtIndex(indexPath.row) as! AppsModel)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerView:UIView = UIView(frame:CGRectZero)
        headerView.backgroundColor = UIColor.blueColor()
        let  label:UILabel = UILabel(frame:CGRectMake(20, 0, 100, 20))
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.systemFontOfSize(16)
        headerView.addSubview(label)
        label.text = arrayOfCharacters![section]
        return headerView
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let  footerView:UIView = UIView(frame:CGRectZero)
        footerView.backgroundColor = UIColor.redColor()
        let  label:UILabel = UILabel(frame:CGRectMake(20, 0, 100, 20))
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.systemFontOfSize(16)
        footerView.addSubview(label)
        label.text = "第\(section)组 组尾"
        return footerView
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayOfCharacters
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

