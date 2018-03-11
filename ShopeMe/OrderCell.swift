//
//  OrderCell.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/11/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var count: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
