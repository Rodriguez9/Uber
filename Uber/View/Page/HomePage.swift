import UIKit

class HomePage: FxBasePage {
    var leftView:UIView?
    var page:UserCenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        //setNavigationItem(title: "account_icon_up.png", selector: Selector("doShowLeft"), isRight: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.addUserCenterView()
    }
    
    func addUserCenterView(){
        page = UserCenter()
        //page!.view.frame=leftView!.bounds
    }
}
