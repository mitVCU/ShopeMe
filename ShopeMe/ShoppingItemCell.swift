//
//  ShoppingItemCell.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/8/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class ShoppingItemCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var addItemBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
