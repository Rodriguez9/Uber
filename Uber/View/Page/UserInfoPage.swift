import UIKit
import MobileCoreServices

class UserInfoPage: FxBasePage,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var backUserView: UIView!
    var image:UIImage?
    var choose:String?
    
    @IBAction func dosetavatar(_ sender: UIButton) {
        alert(sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "建立基本资料"
        //设置圆角
        backView.layer.masksToBounds=true
        backView.layer.cornerRadius=5
        backUserView.layer.masksToBounds=true
        backUserView.layer.cornerRadius=5
        
        setNavigationItem(title: "Back.png", selector: #selector(doBack), isRight: false)
        setNavigationItem(title: "下一步", selector: #selector(doRight), isRight: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateDisplay()
    }
    
    //创建表单
    func alert(sender: UIButton){
        let controller =  UIAlertController(title:nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "拍照", style: .default, handler: {action in
            self.chooseCameraorphotoLibrary(sourceType: .camera)})
        let photoLibrary = UIAlertAction(title: "相册", style: .default, handler: {action in
            self.chooseCameraorphotoLibrary(sourceType: .photoLibrary)})
        let cancel = UIAlertAction(title: "取消", style:.cancel, handler: nil)
        controller.addAction(camera)
        controller.addAction(photoLibrary)
        controller.addAction(cancel)
        if let ppc=controller.popoverPresentationController {
            ppc.sourceRect=sender.bounds
            ppc.sourceView=sender
        }
        present(controller, animated: true, completion: nil)
    }
    
    //选择相机或相册
    func chooseCameraorphotoLibrary(sourceType:UIImagePickerControllerSourceType){
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType)!
        // let mediaType = UIImagePickerController.availableMediaTypes(for:.photoLibrary )!
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && mediaTypes.count>0{
            //UIImagePickerController管理系统界面的视图控制器，用于拍摄照片，录制电影以及从用户的媒体库中选择项目
            let picker = UIImagePickerController()
            picker.mediaTypes = mediaTypes
            //sourceType:控制器显示的选取器接口的类型
            
            //图像选择器的委托对象
            picker.delegate = self
            
            picker.allowsEditing=true
            picker.sourceType = sourceType
            //以模态方式呈现视图控制器。
            self.present(picker, animated: true, completion: nil)
        }
        else{
            let alertCOntroller = UIAlertController(title:"ERROR",message:"Unsupported",preferredStyle:UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.cancel,handler:nil)
            alertCOntroller.addAction(okAction)
            present(alertCOntroller,animated: true,completion: nil)
        }
    }
    
    func updateDisplay(){
        if let mediaType=choose{
            if mediaType==kUTTypeImage as String{
                avatar.image=image!
                avatar.isHidden=false
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        choose=info[UIImagePickerControllerMediaType] as? String
        image=info[UIImagePickerControllerEditedImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func doRight() {
        let page = addPayPage()
        self.navigationController?.pushViewController(page, animated: true)
        
    }
    
}
