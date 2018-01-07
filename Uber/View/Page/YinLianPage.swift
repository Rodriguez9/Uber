import UIKit

class YinLianPage: FxBasePage,UPPayPluginDelegate,NSURLConnectionDataDelegate {
    
    func upPayPluginResult(_ result: String!) {
         FxLog(message: result)
    }
    
    // 支付回调函数
    var responseData:NSMutableData?
    
    @IBAction func doPay() {
        //NSURL()使用提供的URL字符串初始化NSURL对象,表示资源桥接位置的对象URL; 使用NSURL时需要参考的语义或其他特定基金的行为
        let url = NSURL(string:YLTnURL)
        startPay(url: url!)
    }


    func startPay(url:NSURL){
        //NSURLRequest(),代表桥接到URL加载请求的对象URLRequest
        let urlRequest = URLRequest(url:url as URL)
        //NSURLConnection()返回初始化的URL连接，并开始加载URL请求的数据
        let connect = NSURLConnection(request: urlRequest, delegate: self)
        //let connect = URLSession.shared.dataTask(with: urlRequest)
        //connect.resume()
        //导致连接开始加载数据
        connect?.start()
    }


    // URLConnectionDelegate methods
    //当连接收到足够的数据来为其请求构造URL响应时发送
    //NSURLConnection发送消息的连接。
    //URLResponse:连接请求的URL响应。这个对象是不可变的，一旦它被提交给委托，它就不会被URL加载系统修改
    //HTTPURLResponse:与对HTTP协议URL加载请求的响应相关联的元数据
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        let urlResponse = response as! HTTPURLResponse
        //接收者的HTTP状态码
        if urlResponse.statusCode != 200 {
            FxLog(message: "error status code")
        }
        else {
            //一个连接到的动态字节缓冲区
            responseData = NSMutableData()
        }
    }
    
    //作为连接发送增量加载数据
    //data:新提供的数据。委托应该连接每个data交付对象的内容，以构建URL加载的完整数据。
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        responseData?.append(data as Data)
    }

    //当连接完成加载成功时发送
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        let result = String(data: responseData! as Data, encoding: String.Encoding.utf8)
        if result != nil {
            FxPayPlugin.startPayFx(result, mode: "01", viewController: self, delegate: self)
        }
    }
    
    //连接无法成功加载请求时发送
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        FxLog(message: error.localizedDescription)
    }

}
