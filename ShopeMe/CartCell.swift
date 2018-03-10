//
//  CartCell.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/9/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var addItem: UIButton!
    @IBOutlet weak var deleteItem: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

    
}
