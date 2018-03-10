//
//  ShoppingItemsTableViewController.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/8/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit
protocol ShoppingItemsTVCDelegate {
    func finishPassing(cart1: Array<ShoppingItem>?, cartDict: [String: Array<ShoppingItem>]?)
}

class ShoppingItemsTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cartCount: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var items : Array<ShoppingItem> = []
    var cart: Array<ShoppingItem> = []
    var curCart: Array<ShoppingItem> = []
    var section: String?
    var delegate: ShoppingItemsTVCDelegate?
    var cartDict: [String: Array<ShoppingItem>] = [:]
    var carti: Array<cartItem> = []

    struct cartItem{
        var citemName:String
        var quantity:Int
    }



    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        cartCount.text="\(cart.count)"
        super.viewDidLoad()
        print("\(String(describing: section)): current section")
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! ShoppingItemCell
        cell.itemName.text = items[indexPath.row].itemName
        cell.itemImage.image = items[indexPath.row].itemImage
        cell.itemDesc.text = items[indexPath.row].itemDescription
        cell.itemPrice.text = "$\(items[indexPath.row].itemPrice)"
        cell.itemDesc.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.itemDesc.numberOfLines = 3
        cell.yourobj = {
            self.cart.append(self.items[indexPath.row])
            self.curCart.append(self.items[indexPath.row])
            self.dooo()

            self.delegate?.finishPassing(cart1: self.cart, cartDict: self.cartDict)


            print("\(self.cart.count) : num of items in cart")
            self.cartCount.text = "\(self.cart.count)"
        }
        

        return cell
    }


    @IBAction func onTap(_ sender: UIButton) {
        self.performSegue(withIdentifier: "cartVC", sender: self)
        print("som")
    }

    func dooo(){
        if (!cartDict.keys.contains(section!)) {
            cartDict[section!] = curCart
            print("new section")
        }
        else {
            cartDict[section!]!.append(curCart[curCart.endIndex - 1])
            print("same section")

        }


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CartTVC {
            destination.cart = cart
            destination.itemsDict = cartDict
        }
    }// end of prepare for segue
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
