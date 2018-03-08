//
//  ShoppingItem.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/8/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem {
    var itemName: String
    var itemImage: UIImage
    var itemPrice: Double
    var itemDescription: String
    
    init(img:UIImage, nam:String, pric:Double, desc:String) {
        itemPrice = pric
        itemName = nam
        itemImage = img
        itemDescription = desc
    }
}
