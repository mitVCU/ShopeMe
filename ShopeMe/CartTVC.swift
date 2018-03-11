//
//  CartTVC.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/9/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class CartTVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var cart = Array<ShoppingItem>()
    var itemsDict: [String: Array<ShoppingItem>] = [:]
    var sec = Array<String>()

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        sec = Array(itemsDict.keys)
        print("\(sec.description):des  ")

//        for (key,value) in itemsDict {
//            var itemName = Array<String>()
////            print("\(key) : \(String(describing: value))")
////            print("\(value.count) : count before")
//        }
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

            //  var subTot = itemsDict[sec[indexPath.section]]![indexPath.row].itemPrice * Double(counts[temp2[indexPath.row]]!)
        cell.itemName.text = temp2[indexPath.row]
        cell.quantity.text = "\(counts[temp2[indexPath.row]]!)"
        cell.subTotal.text = "$\(price * Double(counts[temp2[indexPath.row]]!))"


        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("\(sec[section]): section name")
        return sec[section]
    }
    


    
    
    
    
    
    
    
    
    
    
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        print("\(itemsDict.count): num of section")
//        return itemsDict.count
//    }
//
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        var itemNam = Array<String>()
//        for i in itemsDict[sec[section]]! {
//            itemNam.append(i.itemName)
//        }
//        print("\(itemsDict[sec[section]]!.count): num of rows per section")
//        return itemsDict[sec[section]]!.count
//    }
//
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCCELL") as! CartCell
////        var itemNam = Array<String>()
////        for i in itemsDict[sec[indexPath.section]]! {
////            itemNam.append(i.itemName)
////        }
//
//
//        cell.cCell.text = "test"
//        //Array(Set(itemNam))[indexPath.row]//itemsDict[sec[indexPath.section]]![indexPath.row].itemName
////        cell.subTotal.text = "$00.00"
////        cell.Quantify.text = "9"
//
//
//        //cell.cCell.text = itemsDict[sec[indexPath.section]]![indexPath.row].itemName
////        print(itemsDict[sec[indexPath.section]]![indexPath.row].itemName)
//        return cell;
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print("not out")
//        print(sec[section])
//        return sec[section]
//    }
//
////    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
////        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! CartCell
////        cell.itemName.text = cart[indexPath.row].itemName
//////        cell.subTotal.text = "$ \(cart[indexPath.row].itemPrice * Double(counts[cart[indexPath.row].itemName]!) )"
//////        cell.count.text = "\(String(describing: counts[cart[indexPath.row].itemName]))"
////        print("making")
////        return cell
////    }
//
//
//
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        // Get the new view controller using segue.destinationViewController.
////        // Pass the selected object to the new view controller.
////    }




}

