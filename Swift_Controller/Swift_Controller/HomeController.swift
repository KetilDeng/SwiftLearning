//
//  HomeController.swift
//  Swift_Controller
//
//  Created by Kerry on 16/4/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.redColor()
        let rightBtn = UIButton.init(frame: CGRectMake(0, 0, 80, 30))
        rightBtn.backgroundColor = UIColor.blueColor()
        rightBtn.setTitle("购物车", forState: UIControlState.Normal)
        rightBtn.addTarget(self, action: "btnClick", forControlEvents: UIControlEvents.TouchUpInside)
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func btnClick()
    {
        let car = CarController()
        car.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(car, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
