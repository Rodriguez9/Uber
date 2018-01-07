//
//  CreateAccountPage.swift
//  Uber
//
//  Created by YZH on 2017/12/13.
//  Copyright © 2017年 YZH. All rights reserved.
//  创建账户页面

import UIKit

class CreateAccountPage: FxBasePage {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="设置账户"
        setNavigationItem(title: "下一步", selector:Selector("doRight"), isRight: true)
        setNavigationItem(title: "取消", selector:#selector(doBack), isRight: false)
        
        //设置圆角
        view.layer.masksToBounds=true
        view.layer.cornerRadius=5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //下一步按钮
    @objc override func doRight() {
        let page = UserInfoPage();
        self.navigationController?.pushViewController(page, animated: true)
        
    }
    
    @IBAction func doSelectCountry(_ sender: UIButton) {
        //实例化查询国家的类
        let page = SelectCountryPage();
        //UINavigationController:容器视图控制器,rootViewController：初始化并返回新创建的导航控制器
        let NavPage = UINavigationController(rootViewController: page)
        //present以模态方式呈现视图控制器,viewControllerTopresent:视图控制器显示当前视图控制器的内容
        //animated:通过true动画演示; 否则，通过false
        //completion:演示完成后要执行的块。该块没有返回值，也没有参数。你可以指定nil这个参数
        self.present(NavPage, animated: true, completion: nil)
    }
    
}

