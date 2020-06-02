
import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var lblAppleProduct: UILabel!
    
    var product: AppleProducts?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblAppleProduct.text = product?.detalString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
