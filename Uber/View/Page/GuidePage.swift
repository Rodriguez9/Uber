//
//  GuidePage.swift
//  Uber
//
//  Created by YZH on 2017/11/28.
//  Copyright © 2017年 YZH. All rights reserved.
//  启动时视频播放,动画，以及按钮时间，即打开的第一个页面

import UIKit
import AVFoundation
class GuidePage: FxBasePage {
    //图片
    @IBOutlet var backImageView: UIImageView?
    //视频
    @IBOutlet var backView: UIView?
    //登录按钮
    @IBAction func doLogin(_ sender: UIButton) {
        print("123")
        locatiion=FxLocation()
        locatiion?.startLocation()
    }
    //注册按钮
    @IBAction func doResign() {
        //showIndicator(tipmessage: "验证", autoHide: true, afterDelay: true)
        let page = CreateAccountPage()
        let navPage = UINavigationController(rootViewController: page)
        self.present(navPage, animated: true, completion: nil)
    }
    
    //AVPlayer:提供界面来控制玩家的运输行为的对象
    var player:AVPlayer!
    //AVPlayerItem:一个对象，用于模拟播放器播放资产的时间和呈现状态
    var playerItem:AVPlayerItem!
    var locatiion:FxLocation?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPlayMedia()
        doAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //初始化67张图片（Uber）
    func doAnimation(){
        var imageName:String?
        var images:[UIImage]=[]
        var image:UIImage?
        
        for index in 0...67{
            //imageName=图片名logo-00X，String,转化为字符串，format格式，3个数不够补0
            imageName = "logo-"+String(format:"%03d",index)
            //UIImage类能够管理底层平台支持的所有图像格式的数据。图像对象是不可变的，因此您总是从现有的图像数据创建它们
            image = UIImage(named: imageName!)
            images.insert(image!,at:index)
        }
        /*
         animationImages
         图像视图可以存储动画图像序列并播放该序列的全部或部分。
         您将图像序列指定为UIImage对象数组并将其分配给属性。
         一旦分配完成，您可以使用此类的方法和属性来配置动画计时以及启动和停止动画。
         */
        backImageView?.animationImages=images
        // animationDuration:经过一个图像周期所花费的时间
        backImageView?.animationDuration=5
        //指定重复动画的次数
        backImageView?.animationRepeatCount=1
        //开始动画在接收器中的图像
        backImageView?.startAnimating()
    }
    
    //初始化视频
    func initPlayMedia(){
        //Bundle:存储在磁盘上的捆绑目录中的代码和资源的表示
        //main:表示包含当前正在执行的代码的包目录。主包对象使您可以访问应用程序附带的资源,返回包含当前可执行文件的包对象
        //path:寻找资源文件,返回由指定名称和文件扩展名标识的资源的完整路径名
        let path = Bundle.main.path(forResource: "welcome_video", ofType: "mp4")
        //NSURL:表示资源桥接的位置的对象URL;
        //fileURL:初始化并返回一个新创建的NSURL对象作为具有指定路径的文件URL
        let url = NSURL.fileURL(withPath: path!)
        //AVPlayerItem:一个对象，用于模拟播放器播放资产的时间和呈现状态
        //使用给定的URL准备播放器项目
        playerItem = AVPlayerItem(url: url)
        /*AVPlayer(playerItem: AVPlayerItem?):初始化新玩家以播放指定的玩家项目*/
        player = AVPlayer(playerItem:playerItem)
        /*
         初始化新玩家以播放由给定URL引用的单个视听资源
         player = AVPlayer(url:url)
         */
        //AVPlayerLayer:管理玩家视觉输出的对象
        //返回播放器图层以显示指定播放器的视觉输出,player播放器层显示视觉输出的播放器
        let playerLayer = AVPlayerLayer(player:player)
        //frame图层的框架矩形
        //bounds图层的边界矩形。动画
        playerLayer.frame=backView!.bounds
        //videoGravity一个值，指定如何在播放器图层的边界内显示视频
        //AVLayerVideoGravity:定义视频如何在图层边界矩形内显示的值
        //resizeAspect:指定播放器应该保留视频的宽高比并将视频适合在图层的边界内
        playerLayer.videoGravity=AVLayerVideoGravity.resizeAspect
        
        /*
            layer:视图的Core Animation图层用于渲染
            //insertSublayer:将指定的图层插入到指定索引的接收者的子图层列表中
            /*func insertSublayer(_ layer: CALayer,at idx: UInt32)
             aLayer:要插入当前图层的子图层
             index要插入的索引。该值必须是数组中有效的从0开始的索引
            */
         */
        backView!.layer.insertSublayer(playerLayer, at: 0)
        backView!.alpha=1.0
    
       
        //使用指定的持续时间，延迟，选项和完成处理程序将更改动画化为一个或多个视图
        //withDuration:动画的总持续时间（以秒为单位）。如果您指定一个负值，或者0更改没有动画
        //delay:在开始动画之前等待的时间（以秒为单位）。指定一个值0来立即开始动画
        //options:指示您如何执行动画的选项掩码
        //animations:包含提交到视图的更改的块对象。这是以编程方式更改视图层次结构中视图的任何动画属性的位置。该块不带参数，没有返回值。这个参数不能是NUL
        //completion:动画序列结束时要执行的块对象
        
        UIView.animate(withDuration:5, delay:0, options:.autoreverse, animations: {
            self.backView!.alpha = 1.0
            self.player!.play()
        }, completion: {
             finished in
//            print("Animation End")
        })
        
        
     /**********************************循环播放*********************************************
        //NotificationCenter一种通知分发机制，使向注册的观察者广播信息
        //default应用程序的默认通知中心
        //addObserver向通知中心的分派表添加一个观察者和一个通知选择器，以及一个可选的通知名称和发送方
        NotificationCenter.default.addObserver ( self,selector: Selector("didFinishVideo:") ,
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime ,object: playerItem)

         func didFinishVideo(sender: NSNotification )
         {
         let item = sender.object as! AVPlayerItem
         item.seek(to: kCMTimeZero)
         self.player.play()
         }
       
 ******************************************************************************* */
    }
}
