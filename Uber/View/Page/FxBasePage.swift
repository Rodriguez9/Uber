//
//  FxBasePage.swift
//  Uber
//
//  Created by YZH on 2017/11/28.
//  Copyright © 2017年 YZH. All rights reserved.
//  添加支付界面

import UIKit

class FxBasePage: FxBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //顶栏:selector选择器,isRight右边按钮
    func setNavigationItem(title:String,selector:Selector,isRight:Bool){
        var item:UIBarButtonItem
        //有无png后缀名
        if title.hasSuffix("png") {
            item=UIBarButtonItem(image:UIImage(named:title),style:.plain,target:self,action:selector)
        }
        else{
            item=UIBarButtonItem(title:title,style:.plain,target:self,action:selector)
        }
        item.tintColor=UIColor.darkGray
        
        if isRight{
            self.navigationItem.rightBarButtonItem=item
        }
        else{
            self.navigationItem.leftBarButtonItem=item
        }
    }
    
    //下一步
    @objc  func doRight(){
        
    }
    //返回键
  @objc func doBack(){
        if self.navigationController!.viewControllers.count > 1 {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
