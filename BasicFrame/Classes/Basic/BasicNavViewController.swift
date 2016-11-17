//
//  BasicNavViewController.swift
//  ttkhj-ios
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

import UIKit

let navColor = UIColor.init(red: 255.0/255.0, green: 120.0/255.0, blue: 0/255.0, alpha: 1.0)

class BasicNavViewController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer!.delegate = self
        //设置navigationbar 的渲染颜色
        navigationBar.tintColor = UIColor.white
        //设置barTintColor
        navigationBar.barTintColor = navColor
        //设置navigationTitle
        let attributes = [NSForegroundColorAttributeName:UIColor.white]
        self.navigationBar.titleTextAttributes = attributes
        
        // Do any additional setup after loading the view.
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count>0{
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        //返回手势
        self.interactivePopGestureRecognizer!.isEnabled = true
        //返回按钮
        let backBarButton = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: #selector(self.backBarButtonItemAction))
        viewController.navigationItem.backBarButtonItem = backBarButton
    }
    
    func backBarButtonItemAction()  {
        self.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
