//
//  ViewController.swift
//  Swift_TableView
//
//  Created by Kerry on 16/4/13.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var items:[String] = []
    var btn:UIButton = UIButton()
    var listTabelView:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btn.frame = CGRectMake(20, 30, 80, 40)
        btn.setTitle("编辑", forState: .Normal)
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action: #selector(ViewController.btnClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
        items = ["UITabelView高级使用","自定义cell","创建分组表","UITextView","UISegmentedControl","UISlider","UISwitch","动画","网络","多媒体","定位","电话短信邮件","检测设备","多点触控","读写应用数据"]
        
        listTabelView = UITableView(frame: CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100), style: UITableViewStyle.Plain)
        self.view.addSubview(listTabelView)
        
        listTabelView.delegate = self
        listTabelView.dataSource = self
    }
    
    func btnClick() {
        if btn.titleForState(UIControlState.Normal) == "编辑"
        {
            listTabelView.setEditing(true, animated: true)
            btn.setTitle("完成", forState: .Normal)
        }
        else
        {
            listTabelView.setEditing(false, animated: true)
            btn.setTitle("编辑", forState: .Normal)
        }
    }
    
    //返回行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    //返回cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cellid")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellid")
        }
        cell.textLabel?.text = items[indexPath.row]
        cell?.textLabel!.font = UIFont.systemFontOfSize(14)
        cell!.accessoryType = .DisclosureIndicator
        cell!.imageView?.image = UIImage(named: "user_icon")
        cell!.detailTextLabel?.text = "详细内容"
        cell!.detailTextLabel?.font = UIFont.systemFontOfSize(12)
        cell.accessoryType = .DetailDisclosureButton
        
        return cell
    }
    
    //返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    //点击cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell! = tableView.cellForRowAtIndexPath(indexPath)
        print(cell.textLabel!.text)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //是否可编辑
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //每一行的编辑类型
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if indexPath.row%2 == 0
        {
            return .Insert
        }
        else
        {
            return .Delete
        }
    }
    
    //指定单元格是否可以拖动
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //删除、插入
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete
        {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
        else if (editingStyle == .Insert)
        {
            items.append("新城市\(items.count)")
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Middle)
        }
    }
    
    //移动单元格
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        if sourceIndexPath != destinationIndexPath
        {
            let itemValue:String = items[sourceIndexPath.row]
            items.removeAtIndex(destinationIndexPath.row)
            if sourceIndexPath.row > destinationIndexPath.row
            {
                items.append(itemValue)
            }
            else
            {
                items.insert(itemValue, atIndex: destinationIndexPath.row)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

