//
//  category.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/9/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import Foundation
import UIKit

class category {
    var categoryName: String
    var categoryImage: UIImage
    var categoryContents: Array<ShoppingItem>
    
    init(img:UIImage, nam:String, catCon:Array<ShoppingItem>) {
        categoryName = nam
        categoryImage = img
        categoryContents = catCon
    }
}
