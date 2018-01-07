//
//  VerifyPhone.swift
//  Uber
//
//  Created by YZH on 2018/1/4.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

class VerifyPhone: FxBasePage {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="验证"
        setNavigationItem(title: "Back.png", selector: #selector(doBack), isRight: false)
        setNavigationItem(title: "主页面", selector: #selector(doRight), isRight: true)
    }
 
    override func doRight() {
        //在延迟之后，使用默认模式在当前线程上调用接收方的方法
        self.perform(#selector(VerifyPhone.doShowHomePage), with: nil, afterDelay: 1.0)
    }
    //UIApplication:在iOS中运行的应用程序的集中控制点和协调点
    //shared:返回单例应用程序实例
   //delegate 应用程序对象的代表
    @objc func doShowHomePage(){
        let appDeg = UIApplication.shared.delegate as! AppDelegate
        appDeg.doshowHomePage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
