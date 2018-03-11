//
//  Order.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/9/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class Order {
    var count:Int
    var price:Double
    var date:Date
    
    init(quan:Int, pri:Double, day:Date) {
        count = quan
        price = pri
        date = day
    }
}
