//
//  CartTVC.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/9/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit
protocol CartTVCDelegate {
    func finishPassCart(cart1: Array<ShoppingItem>?, cartDict: [String: Array<ShoppingItem>]?, orders: Array<Order>?)
}

class CartTVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func onClickEmpty(_ sender: Any) {
        itemsDict.removeAll()
        cart.removeAll()
        total=0.0
        quant=0
        totalCost.text="$\(total)"
        totalQuant.text="\(quant)"
        tableView.reloadData()
    }
    
    @IBAction func onClickBuy(_ sender: Any) {
        createAlert(title: "PAYMENT", message: "Your Card Will be Charged \(total)")
    }
    
    
    @IBOutlet weak var totalQuant: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    
    var cart = Array<ShoppingItem>()
    var itemsDict: [String: Array<ShoppingItem>] = [:]
    var sec = Array<String>()
    var total = 0.0
    var quant = 0
    var curSection : String = ""
    var Orders = Array<Order>()
    var cartDelegate: CartTVCDelegate?

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        sec = Array(itemsDict.keys)
        print("\(sec.description):des  ")

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        print("\(itemsDict.count): num of Section")
        return itemsDict.count
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var temp = Array<String>()
        for item in (itemsDict[sec[section]])!{
            temp.append(item.itemName)
        }
        let temp2 = Array(Set(temp))
        print("\(temp2.count): number of rows in section")
        return temp2.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! CartCell

        var temp = Array<String>()
        var counts: [String: Int] = [:]
        var price = Double()

        for item in (itemsDict[sec[indexPath.section]])!{
            temp.append(item.itemName)
            counts[item.itemName] = (counts[item.itemName] ?? 0) + 1
        }
        let temp2 = Array(Set(temp))

        for item in (itemsDict[sec[indexPath.section]])! {
            if item.itemName == temp2[indexPath.row]{
                price=item.itemPrice
            }
        }
        total = total + (price * Double(counts[temp2[indexPath.row]]!))
        quant = quant + (counts[temp2[indexPath.row]]!)

        cell.itemName.text = temp2[indexPath.row]
        cell.quantity.text = "\(counts[temp2[indexPath.row]]!)"
        cell.subTotal.text = "$\(price * Double(counts[temp2[indexPath.row]]!))"
        totalCost.text="$\(total)"
        totalQuant.text="\(cart.count)"
        return cell
    }
    @IBAction func onDeleteClick(_ sender: UIButton) {
        let touchPoint: CGPoint = sender.convert(CGPoint.zero, to: self.tableView)
        let clickedButtonIndexPath = self.tableView.indexPathForRow(at: touchPoint)
        if(clickedButtonIndexPath != nil)
        {
            NSLog("index path.section ==%ld", Int(clickedButtonIndexPath!.section))
            NSLog("index path.row ==%ld", Int(clickedButtonIndexPath!.row))
            //itemsDict[sec[clickedButtonIndexPath!.section]]?.remove(at: clickedButtonIndexPath!.row)
        }
//       tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("\(sec[section]): section name")
        return sec[section]
    }

    func createAlert (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Place Order", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            // Get 1st TextField's text
            self.Orders.append( Order(quan: self.quant, pri: self.total, day: Date()))

            print(self.Orders.description, "print orders being sent")
            self.cartDelegate?.finishPassCart(cart1: self.cart, cartDict: self.itemsDict, orders: self.Orders)
            self.performSegue(withIdentifier: "unWindly", sender: self)

            self.itemsDict.removeAll()
            self.cart.removeAll()
            self.total=0.0
            self.quant=0
            self.totalCost.text="$\(self.total)"
            self.totalQuant.text="\(self.quant)"
            self.tableView.reloadData()
            print(self.cart.count, "should be 0")
        }))

        self.present(alert, animated: true, completion: nil)
    }


}

