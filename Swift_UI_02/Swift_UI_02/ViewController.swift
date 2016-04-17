//
//  ViewController.swift
//  Swift_UI_02
//
//  Created by Kerry on 16/4/17.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate,UIAlertViewDelegate,UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:UITextView
        let customTextView = UITextView(frame: CGRectMake(15.0, 64.0, self.view.bounds.size.width - 30, 150))
        customTextView.backgroundColor = UIColor.grayColor()
        customTextView.text = "Hello world ! My name is dengketao, I love swift. Let's learn it together.Hello world ! My name is dengketao, I love swift. Let's learn it together.Hello world ! My name is dengketao, I love swift. Let's learn it together.Hello world ! My name is dengketao, I love swift. Let's learn it together.Hello world ! My name is dengketao, I love swift. Let's learn it together.Hello world ! My name is dengketao, I love swift. Let's learn it together.Hello world ! My name is dengketao, I love swift. Let's learn it together.Hello world ! My name is dengketao, I love swift. Let's learn it together."
        customTextView.font = UIFont.systemFontOfSize(18)
        self.view.addSubview(customTextView)
        customTextView.delegate = self
        
        // MARK:UISegmentedControl
        let appsArray = ["Kerry","","Matt"]
        let segment:UISegmentedControl = UISegmentedControl(items: appsArray)
        segment.frame = CGRectMake(customTextView.frame.origin.x, CGRectGetMaxY(customTextView.frame) + 20, customTextView.frame.size.width, 40)
        self.view.addSubview(segment)
        //当前选中分段
        segment.selectedSegmentIndex = 1
        //设置某一分段title
        segment.setTitle("Jon", forSegmentAtIndex: 1)
        //获取信息
        let count = segment.numberOfSegments
        let title = segment.titleForSegmentAtIndex(2)
        let image = segment.imageForSegmentAtIndex(0)
        let color = segment.tintColor
        
        //设置标题颜色
        segment.tintColor = UIColor.redColor()
        //设置某一分段宽度
        segment.setWidth(60, forSegmentAtIndex: 2)
        //设置内容偏移
        segment.setContentOffset(CGSizeMake(10, 10), forSegmentAtIndex: 1)
        //插入图片
        segment.insertSegmentWithImage(UIImage(named: "address"), atIndex: 1, animated: true)
        //设置图片
        //segment.setImage(UIImage(named: ""), forSegmentAtIndex: 0)
        segment.addTarget(self, action: Selector("segmentChange:"), forControlEvents: UIControlEvents.ValueChanged)
        
        // MARK:UISlider
        let slider:UISlider = UISlider(frame: CGRectMake(customTextView.frame.origin.x, CGRectGetMaxY(segment.frame)+20 , customTextView.frame.size.width, 60))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 40
        self.view.addSubview(slider)
        //slider.backgroundColor = UIColor.redColor()
        
        slider.addTarget(self, action: Selector("sliderValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
        // 设置停止拖动才会触发 sliderValueChange
        slider.continuous = false
        
        // MARK:UISwitch、UISetepper
        let customSwitch:UISwitch = UISwitch(frame:CGRectMake(customTextView.frame.origin.x, CGRectGetMaxY(slider.frame) + 20, 60, 40))
        self.view.addSubview(customSwitch)
        customSwitch.on = true
        customSwitch.addTarget(self, action: Selector("switchChange:"), forControlEvents: UIControlEvents.ValueChanged)
        
        let stepper:UIStepper = UIStepper(frame:CGRectMake(CGRectGetMaxX(customSwitch.frame) + 20, customSwitch.frame.origin.y, 80, customSwitch.frame.size.height))
        self.view.addSubview(stepper)
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.value = 50
        stepper.stepValue = 5
        stepper.addTarget(self, action: Selector("stepperChange:"), forControlEvents: UIControlEvents.ValueChanged)
        
        // MARK: UIActivityIndicator、UIProgressView
        let activityIndicatorView:UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(customTextView.frame.origin.x, CGRectGetMaxY(customSwitch.frame) + 20, 30, 30))
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.activityIndicatorViewStyle = .Gray
        activityIndicatorView.startAnimating()
        // 系统状态栏上的活动指示器
        var app:UIApplication = UIApplication.sharedApplication()
        app.networkActivityIndicatorVisible = true
        
        let progressView:UIProgressView = UIProgressView(frame: CGRectMake(customTextView.frame.origin.x, CGRectGetMaxY(activityIndicatorView.frame) + 20, customTextView.frame.size.width, 40))
        self.view.addSubview(progressView)
        //progressView.progress = 0.5
        progressView.setProgress(0.5, animated: true)
        progressView.progressTintColor = UIColor.redColor()
        progressView.trackTintColor = UIColor.blueColor()
        
        // MARK: UIAlertView、UIActionSheet
        var btn1 = UIButton(frame: CGRectMake(customTextView.frame.origin.x, CGRectGetMaxY(progressView.frame) + 20, 150, 40))
        btn1.setTitle("UIAlertView", forState: UIControlState.Normal)
        btn1.backgroundColor = UIColor.blueColor()
        self.view.addSubview(btn1)
        btn1.tag = 1
        btn1.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var btn2 = UIButton(frame: CGRectMake(CGRectGetMaxX(btn1.frame) + 10, CGRectGetMaxY(progressView.frame) + 20, 150, 40))
        btn2.setTitle("UIActionSheet", forState: UIControlState.Normal)
        btn2.backgroundColor = UIColor.blueColor()
        self.view.addSubview(btn2)
        btn2.tag = 2
        btn2.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        

        
        
    }
    
    func btnClick(sender:AnyObject?)
    {
        let btn:UIButton = sender as! UIButton
        if btn.tag == 1
        {
//            let alertView:UIAlertView = UIAlertView(title: "提醒", message: "hello world！hello world！hello world！hello world！", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
//            alertView.show()
            
            let alertController:UIAlertController = UIAlertController(title: "提醒", message: "hello world！hello world！hello world！hello world！", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction1 = UIAlertAction(title: "取消",style: .Cancel, handler: nil)
            let alertAction2 = UIAlertAction(title: "确定",style: .Default, handler: nil)
            alertController.addAction(alertAction1)
            alertController.addAction(alertAction2)
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else
        {
//            let actionSheet:UIActionSheet = UIActionSheet(title: "提醒", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "摧毁", otherButtonTitles: "确定")
//            actionSheet.showInView(self.view)
            
            let alertController:UIAlertController = UIAlertController(title: "提醒", message: "hello world！hello world！hello world！hello world！", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let alertAction1 = UIAlertAction(title: "取消",style: .Cancel, handler: nil)
            let alertAction2 = UIAlertAction(title: "摧毁",style: .Destructive, handler: nil)
            let alertAction3 = UIAlertAction(title: "确定",style: .Default, handler: nil)
            alertController.addAction(alertAction1)
            alertController.addAction(alertAction2)
            alertController.addAction(alertAction3)
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    func stepperChange(sender:AnyObject?)
    {
        let stepper:UIStepper = sender as! UIStepper
        print("\(stepper.value)")
    }
    
    func switchChange(sender:AnyObject?)
    {
        let newSwitch:UISwitch = sender as! UISwitch
        print("\(newSwitch.on)")
    }
    
    func sliderValueChange(sender:AnyObject?)
    {
        let slider:UISlider = sender as! UISlider
        print("\(slider.value)")
    }

    func segmentChange(sender:AnyObject?)
    {
        let segment:UISegmentedControl = sender as! UISegmentedControl
        print("\(segment.titleForSegmentAtIndex(segment.selectedSegmentIndex))")
        
        switch segment.selectedSegmentIndex
        {
        case 0:
            print("000")
            
        case 1:
            print("111")
            
        case 2:
            print("222")
            
        case 3:
            print("333")
            
        default:
            print("default")
        }
    }
    
    // MARK:UITextViewDelegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n"
        {
            textView.resignFirstResponder()
            return false
        }
        else
        {
            return true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

