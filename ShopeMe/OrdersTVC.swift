//
//  OrdersTVC.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/10/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class OrdersTVC: UIViewController {

    var Orders: Array<Order> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Orders.description)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
