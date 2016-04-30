//
//  RootController.swift
//  Swift_Controller
//
//  Created by Kerry on 16/4/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit



class RootController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor.redColor()
        
        let homeVC = HomeController()
        homeVC.title = "首页"
        let homeItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "tab_home_icon"), selectedImage: UIImage.init(named: "tab_home_select_icon"))
        homeVC.tabBarItem = homeItem
        let homeNav = UINavigationController(rootViewController:homeVC)
        
        let carVC = CarController()
        carVC.title = "购物车"
        let carItem = UITabBarItem.init(title: "购物车", image: UIImage.init(named: "tab_car_icon"), selectedImage: UIImage.init(named: "tab_car_select_icon"))
        carVC.tabBarItem = carItem
        let carNav = UINavigationController(rootViewController:carVC)
        
        let serviceVC = ServiceController()
        serviceVC.title = "客服"
        let serviceItem = UITabBarItem.init(title: "客服", image: UIImage.init(named: "tab_service_icon"), selectedImage: UIImage.init(named: "tab_service_select_icon"))
        serviceVC.tabBarItem = serviceItem
        let serviceNav = UINavigationController(rootViewController:serviceVC)
        
        let userVC = UserController()
        userVC.title = "我的"
        let userItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "tab_user_icon"), selectedImage: UIImage.init(named: "tab_user_select_icon"))
        userVC.tabBarItem = userItem
        let userNav = UINavigationController(rootViewController:userVC)
        
        self.viewControllers = [homeNav, carNav, serviceNav, userNav]
        
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
