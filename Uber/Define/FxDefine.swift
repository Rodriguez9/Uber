//
//  FxDefine.swift
//  Uber
//
//  Created by YZH on 2017/12/11.
//  Copyright © 2017年 YZH. All rights reserved.
//  常量

import Foundation
import UIKit
let LoadingTip = "加载中"

//当前机的尺寸
let ScreenHeight = UIScreen.main.bounds.size.height
let iOS11:Float = 11.0


//如果是DEBUG版本，输出信息,#function:当前函数
func FxLog(message:String,function:String = #function){
    #if DEBUG
        print("Log:\(message),\(#function)")
    #else
            
    #endif
}

func isSystemiOS11() -> Bool {
    let version:NSString = UIDevice.current.systemVersion as NSString
    if (version.floatValue - iOS11 < 1) {
        return true;
    }
    return false;
}

func isiPhone5s()->Bool{
    if ScreenHeight==568{
        return true
    }
    #if os(iOS)
        FxLog(message: "iOS")
    #else

    #endif
    return false
}


