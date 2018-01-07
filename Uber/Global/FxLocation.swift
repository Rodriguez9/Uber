//
//  FxLocation.swift
//  Uber
//
//  Created by YZH on 2017/12/6.
//  Copyright © 2017年 YZH. All rights reserved.
//  位置管理

import UIKit
import CoreLocation

class FxLocation: NSObject,CLLocationManagerDelegate {
    //CLLocationManager:位置管理器,用于启动和停止向与您的应用程序交付位置相关事件的对象。    
	var manager:CLLocationManager?
    
    func startLocation() {
        if CLLocationManager.locationServicesEnabled(){

            //实例化位置管理器
            manager = CLLocationManager()

            //delegate：设置委托对象接收更新事件,用于从定位服务接收数据
            manager?.delegate=self// as! CLLocationManagerDelegate

            //desiredAccuracy:期望的精度
	        //kCLLocationAccuracyBest使用最高级别的准确性
            manager?.desiredAccuracy=kCLLocationAccuracyBest

            //distanceFilter:在更新事件生成之前，设备必须水平移动的最小距离（以米为单位）,默认值是。kCLDistanceFilterNone		
            manager?.distanceFilter=100

            //启动位置管理器
            manager?.startUpdatingLocation()
            //每次应用程序运行时都请求使用位置服务的权限
            manager?.requestAlwaysAuthorization()
        }
    }
/***************************************反地理编码*********************************
    func searchAddress(location:CLLocation)
    {
        let corder = CLGeocoder()
        print("qwe")
        corder.reverseGeocodeLocation(location, completionHandler: {
            (marks:[CLPlacemark]?,error:NSError?) in
            if marks != nil {
                print("rty")
                for mark in marks! {
                    FxLog(message: mark.name!)
                    print("r4545")
                }
            }
            } as! CLGeocodeCompletionHandler)
    }

    func locationManager(manager: CLLocationManager,didChangeAuthorizationStatus status:CLAuthorizationStatus) {
        FxLog(message: String(describing: status))
        print("321")
    }

    func locationManager(manager: CLLocationManager,didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation)
    {
        searchAddress(location: newLocation)
        print("3")
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        searchAddress(location:locations[0])
        print("1")
        //停止更新位置（如果定位服务不需要实时更新的话，那么应该停止位置的更新）
        manager.stopUpdatingLocation()
    }
 *************************************************************************************************/
}


