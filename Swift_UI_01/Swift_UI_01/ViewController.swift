//
//  ViewController.swift
//  Swift_UI_01
//
//  Created by Kerry on 16/4/11.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()
        createTextField()
        createButton()
    }
    
    
    func createButton()
    {
        var myButton = UIButton(frame:CGRectMake(100, 220, 200, 60))
        self.view.addSubview(myButton)
        myButton.titleLabel?.font = UIFont.systemFontOfSize(17)
        myButton.layer.borderWidth = 2
        myButton.layer.backgroundColor = UIColor.yellowColor().CGColor
        myButton.layer.cornerRadius = 5
        myButton.layer.masksToBounds = true
        myButton.backgroundColor = UIColor.redColor()
        myButton.setTitle("hello world", forState: .Normal)
        myButton.addTarget(self, action: #selector(ViewController.buttonClick), forControlEvents: .TouchUpInside)
    }
    
    func buttonClick(){
        print("按钮点击")
    }
    
    func createTextField()
    {
        var passwordTextField:UITextField = UITextField(frame:CGRectMake(100,160,200,50))
        
        passwordTextField.backgroundColor = UIColor.grayColor()
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.background = UIImage(named: "testImage")
        passwordTextField.textColor = UIColor.blackColor()
        passwordTextField.font = UIFont.systemFontOfSize(14)
        passwordTextField.textAlignment = .Center
        passwordTextField.layer.borderWidth = 5
        passwordTextField.layer.borderColor = UIColor.yellowColor().CGColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        
        var leftView:UIView = UIView(frame:CGRectMake(0, 0, 40, 40))
        leftView.backgroundColor = UIColor.blueColor()
        passwordTextField.leftView = leftView
        passwordTextField.leftViewMode = .WhileEditing
        passwordTextField.autocapitalizationType = .Words
        passwordTextField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didEdingNotification", name: UITextFieldTextDidEndEditingNotification, object: nil)
        
        self.view.addSubview(passwordTextField)
        
    }
    
    func didEdingNotification() {
        print("结束编辑")
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("改变中....")
        return true
    }
    
    func createLabel()
    {
        var nameLabel:UILabel = UILabel(frame:CGRectMake(100,50,200,50))
        self.view.addSubview(nameLabel)

        nameLabel.text = "dengketaodengketao"
        nameLabel.tag = 168
        nameLabel.font = UIFont.systemFontOfSize(22)
        nameLabel.backgroundColor = UIColor(red:125/255.0, green:111/255.0, blue:11/255.0, alpha:1)
        nameLabel.textColor = UIColor.blueColor()
        nameLabel.shadowColor = UIColor.greenColor()
        nameLabel.shadowOffset = CGSizeMake(2, 0)
        nameLabel.textAlignment = .Center
        nameLabel.userInteractionEnabled = true
        nameLabel.lineBreakMode = .ByTruncatingHead
        nameLabel.numberOfLines = 2
        nameLabel.minimumScaleFactor = 10.0
        nameLabel.highlighted = true
        nameLabel.highlightedTextColor = UIColor.greenColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

