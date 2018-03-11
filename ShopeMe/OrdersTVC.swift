//
//  OrdersTVC.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/10/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class OrdersTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var Orders: Array<Order> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Orders.description)
        tableView.delegate = self
        tableView.dataSource = self
        Orders.sort(by: { $0.date.compare($1.date) == .orderedDescending })
        var stop: Bool = false
        while (!stop) {
            if Orders.count > 10 {
                Orders.remove(at: 0)
            } else {
                stop = true
            }
        }
        navigationItem.rightBarButtonItem = editButtonItem
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Orders.count
    }


    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell  = tableView.dequeueReusableCell(withIdentifier: "orderCell") as! OrderCell
        cell.date.text = "\(Orders[indexPath.row].date)"
        cell.count.text = "\(Orders[indexPath.row].count)"
        cell.price.text = "\(Orders[indexPath.row].price)"

        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        let status = navigationItem.rightBarButtonItem?.title
        
        if status == "Edit" {
            tableView.isEditing = true
            navigationItem.rightBarButtonItem?.title = "Done"
        }
        else {
            tableView.isEditing = false
            navigationItem.rightBarButtonItem?.title = "Edit"
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Orders.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}//end of class
