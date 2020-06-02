
import UIKit

class AppleProducts {
    var productName: String?
    var productCategory: String?
    var detalString: String?
    
    init(prName:String, prCategory:String, prDetal:String) {
        self.productName = prName
        self.productCategory = prCategory
        self.detalString = prDetal
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblAppleProducts: UITableView!
    
    var productArray = [AppleProducts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let country_1 = AppleProducts(prName: "Ukraine (Україна)", prCategory: "Kiew", prDetal: "Україна це найбільша країна в Європі")
        productArray.append(country_1)
        let country_2 = AppleProducts(prName: "Russia (Росія)", prCategory: "Moscow", prDetal: "Росія - найбільша країна в світі")
        productArray.append(country_2)
        let country_3 = AppleProducts(prName: "Slovak Rep. (Словакія)", prCategory: "Bratuslava", prDetal: "Ближній сусід України")
        productArray.append(country_3)
        let country_4 = AppleProducts(prName: "Czech Rep. (Чехія)", prCategory: "Praga", prDetal: "Країна в центрі Європи")
        productArray.append(country_4)
        let country_5 = AppleProducts(prName: "France (Франція)", prCategory: "Paris", prDetal: "Найпопулярніша країна для туристів")
        productArray.append(country_5)
        let country_6 = AppleProducts(prName: "Germany (Німеччина)", prCategory: "Berlin", prDetal: "Технологічна столиця світу")
        productArray.append(country_6)
        let country_7 = AppleProducts(prName: "Italy (Італія)", prCategory: "Rome", prDetal: "Славиться своїми різномінітними блюдами")
        productArray.append(country_7)
        let country_8 = AppleProducts(prName: "Hungary (Венгрія)", prCategory: "Budapest", prDetal: "Сусід з Україною на Заході")
        productArray.append(country_8)
        let country_9 = AppleProducts(prName: "Belorus (Беларусь)", prCategory: "Minsk", prDetal: "Сільсько-господарська країна із СНГ")
        productArray.append(country_9)
        let country_10 = AppleProducts(prName: "Poland (Польша)", prCategory: "Krakow", prDetal: "Європейська країна яка стрімко росте в економічному плані")
        productArray.append(country_10)
        
        tblAppleProducts.dataSource = self
        tblAppleProducts.delegate = self

    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "productstable")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "productstable")
        }
        
        cell?.textLabel?.text = productArray[indexPath.row].productName
        cell?.detailTextLabel?.text = productArray[indexPath.row].productCategory
        
        return cell!
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailVC {
            destination.product = productArray[(tblAppleProducts.indexPathForSelectedRow?.row)!]
            tblAppleProducts.deselectRow(at: tblAppleProducts.indexPathForSelectedRow!, animated: true)

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

