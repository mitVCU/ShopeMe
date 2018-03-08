//
//  ShoppingItemsTableViewController.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/8/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class ShoppingItemsTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var items : Array<ShoppingItem> = []
    
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(items.count) here")
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! ShoppingItemCell
        cell.itemName.text = items[indexPath.row].itemName
        cell.itemImage.image = items[indexPath.row].itemImage
        cell.itemDesc.text = items[indexPath.row].itemDescription
        cell.itemPrice.text = "$\(items[indexPath.row].itemPrice)"
        return cell
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
