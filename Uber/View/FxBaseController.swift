//
//  FxBaseController.swift
//  Uber
//
//  Created by YZH on 2017/11/28.
//  Copyright © 2017年 YZH. All rights reserved.
//界面

import UIKit

class FxBaseController: UIViewController {

    //定义一个变量,表示加载和等待效果
    var activity:FxActivity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //显示等待效果在View中
    func showActivityInView(view:UIView) -> FxActivity {

        let activity=FxActivityIndicator(view: view)
        //frame图层的框架矩形
        //bounds图层的边界矩形。动画
        activity?.frame=view.bounds
        //???????????????
        view.addSubview(activity!)
        //activity?.labelText=""
        return activity!
    }

    func showIndicator(tipmessage:String,autoHide:Bool,afterDelay:Bool){
        if activity==nil{
            activity=showActivityInView(view: self.view)
        }
        if tipmessage != nil{
            activity?.labelText=tipmessage
            activity?.show(true)
        }
        if autoHide{
            if afterDelay{
                activity?.hide(false, afterDelay: 5)
            }
            else{
                activity?.hide(true)
            }
            
        }
    }

    //隐藏等待
    func hideIndicator()
    {
        activity?.hide(true)
    }

}
