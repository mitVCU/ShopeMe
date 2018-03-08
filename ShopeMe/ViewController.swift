//
//  ViewController.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/7/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var cartCount = 0
    var categories = ["Recent Orders", "Cart", "Decorations", "Lights", "Desserts", "Clothing", "Candy", "Presents", "Drinks", "Christmas Trees"]
    
    let categoriesImage = [
        UIImage(named: "Recent Orders"),
        UIImage(named: "Cart"),
        UIImage(named: "Decorations"),
        UIImage(named: "Lights"),
        UIImage(named: "Desserts"),
        UIImage(named: "Clothing"),
        UIImage(named: "Candy"),
        UIImage(named: "Presents"),
        UIImage(named: "Drinks"),
        UIImage(named: "Christmas Trees")
    ]
    
    var cart = [String]()
    
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        if (cart.count != 0){
            categories[1] = "cart (\(cart.count))"
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return categories.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CategoryCell
        
        cell.imageCell.image = categoriesImage[indexPath.row]
        cell.lableCell.text = categories[indexPath.row]
        
        return cell
    }
    
    
    
        
    
    

}//end of ViewController

