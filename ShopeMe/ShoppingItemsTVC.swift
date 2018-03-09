//
//  ShoppingItemsTableViewController.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/8/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit
protocol ShoppingItemsTVCDelegate {
    func finishPassing(cart1: Array<ShoppingItem>?)
}

class ShoppingItemsTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cartCount: UILabel!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var items : Array<ShoppingItem> = []
    var cart: Array<ShoppingItem> = []
    var delegate: ShoppingItemsTVCDelegate?

    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        cartCount.text="\(cart.count)"
        super.viewDidLoad()
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(items.count) :item Count")
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
            print("\(self.cart.count) here")
            self.delegate?.finishPassing(cart1: self.cart)
            self.cartCount.text = "\(self.cart.count)"
        }
        

        return cell
    }
 
    @IBAction func onClickCart(_ sender: UIButton) {
        performSegue(withIdentifier: "cartToCart", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CartTVC{
            destination.cart = cart
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
