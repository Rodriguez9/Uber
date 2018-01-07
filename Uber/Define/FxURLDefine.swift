//
//  FxURLDefine.swift
//  Uber
//
//  Created by YZH on 2017/12/11.
//  Copyright © 2017年 YZH. All rights reserved.
//

import Foundation

let YLTnURL = "http://101.231.204.84:8091/sim/getacptn"

func ServerAddress()->String
{
    #if AppStore
        let serveraddress = "http://www.Uber.com"
    #else
        let serveraddress = "http://172.16.19.18"
    #endif
    return serveraddress
}
