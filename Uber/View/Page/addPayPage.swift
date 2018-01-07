import UIKit

class addPayPage: FxBasePage,UITableViewDelegate,UITableViewDataSource {
    
    var datas:[PayInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="添加付款方式"
        setNavigationItem(title: "Back.png", selector: #selector(doBack), isRight: false)
        setNavigationItem(title: "验证", selector: "doRight", isRight: true)
        initdata()
    }
    
    override func doRight() {
        let page = VerifyPhone()
        self.navigationController?.pushViewController(page, animated: true)
        
    }
    func initdata(){
        var data:PayInfo!
        let dict:[String:String] = ["百度钱包" : "BaiDuWallet.png",
                                    "支付宝" : "AliPay.png",
                                    "银联" : "YinLian.png",
                                    "国际信用卡" : "CreditCard.png"]
        datas=[]
        for (key,value) in dict{
            data=PayInfo()
            data.name=key
            data.icon=value
            datas?.append(data)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectedBackgroundView?.backgroundColor=UIColor.blue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableIdentifier")
        if(cell==nil){
            cell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"SimpleTableIdentifier")
        }
        let data = datas[indexPath.row]
        cell?.textLabel?.text = data.name
        cell?.imageView?.image = UIImage(named: data.icon)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row==2){
        let page = YinLianPage()
            self.navigationController?.pushViewController(page, animated: true)}
    }
    
}
