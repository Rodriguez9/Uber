//
//  SelectCountryPage.swift
//  Uber
//
//  Created by YZH on 2017/12/16.
//  Copyright © 2017年 YZH. All rights reserved.
//选择国家列表(未完成)

import UIKit

class SelectCountryPage:FxBasePage{
    @IBOutlet weak var tableview: UITableView!
    //国家类型
    var country:[CountryInfo]?
    //头部A,B,C,D....
    var head:[String]?
    
    var dictData:[String:AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="选择国家／地区"
        setNavigationItem(title: "取消", selector: #selector(doBack), isRight: false)
        initCountry()
        print("2123")
        initDatas()
         print("2123")
        //创建一个重用的单元格
        self.tableview!.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        self.tableview.reloadData()
    }

    func initCountry(){
        let arrCodes = NSLocale.isoCountryCodes
        let locale:NSLocale=NSLocale.current as NSLocale
        var info:CountryInfo!
        country = []
        for code in arrCodes{
            info=CountryInfo()
            info.code=code
            info.name=locale.displayName(forKey: NSLocale.Key.countryCode, value: code)!
            country?.append(info)
        }
//        country?.sort(by: {
//            (arg1:CountryInfo, arg2:CountryInfo) -> Bool in
//            return arg1.name.localizedCaseInsensitiveCompare(arg2.name) == .orderedAscending
//        })
    }
    
    func initDatas(){
        var firstLetter:String!
        var datas:[CountryInfo]!
        head=[]
        datas=[]
        dictData=[:]
        for country in country!{
            firstLetter=FxString.firstCharactor(country.name)
            if !(head!.contains(firstLetter)){
                if datas.count>0{
                    dictData![head!.last!]=datas as AnyObject
                }
                head?.append(firstLetter)
                datas=[]
            }
            datas.append(country)
        }
        //加上最后一个
        dictData![head!.last!]=datas as AnyObject
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return head!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let key = head![section]
        let datas = dictData![key] as! [CountryInfo]
        
        return datas.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return head![section]
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]?
    {
        var indexs:[String]=[]
        var char:[CChar]=[0,0]
        var i = 65
        for i in 65...65+26 {
            char[0] = CChar(i)
            indexs.append(String.init(cString: char))
        }
        
        indexs.append("#")
        
        return indexs
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
        let identify:String = "CellID"
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath as IndexPath)
            as UITableViewCell
        
        let key = head![indexPath.section]
        let datas = dictData![key] as! [CountryInfo]
        let country = datas[indexPath.row]
        
        cell.accessoryType = .none
        cell.textLabel?.text = country.name!
        
        return cell
    }
    
    // UITableViewDelegate 方法，处理列表项的选中事件
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
//
//        let cell:UITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath)
//
//        cell!.accessoryView = UIImageView(image: UIImage(named: "Back.png"))
//
//        self.doBack()
//    }
    
    override func doBack()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

