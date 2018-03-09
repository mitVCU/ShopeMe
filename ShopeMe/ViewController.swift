//
//  ViewController.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/7/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ShoppingItemsTVCDelegate {
   
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    

    var categories = ["Recent Orders", "Cart(0)", "Decorations", "Desserts", "Clothing", "Candy", "Presents", "Drinks", "Christmas Trees", "Manager"]
    
    let categoriesImage = [
        UIImage(named: "Recent Orders"),
        UIImage(named: "Cart"),
        UIImage(named: "Decorations"),
        UIImage(named: "Desserts"),
        UIImage(named: "Clothing"),
        UIImage(named: "Candy"),
        UIImage(named: "Presents"),
        UIImage(named: "Drinks"),
        UIImage(named: "Christmas Trees"),
        UIImage(named: "Manager")
    ]
    
    
    
    var recentOrders = [ShoppingItem]()
    var cart = [ShoppingItem]()
    var decorations = [ShoppingItem]()
    var Desserts = [ShoppingItem]()
    var clothing = [ShoppingItem]()
    var candy = [ShoppingItem]()
    var presents = [ShoppingItem]()
    var drinks = [ShoppingItem]()
    var xMasTree = [ShoppingItem]()
    

    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if (cart.count != 0){
            categories[1] = "cart (\(cart.count))"
        }
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree"))
        ////////////////////////////////////////////////////////////////////////////
        drinks.append(ShoppingItem(img: UIImage(named: "drink1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree"))
        ////////////////////////////////////////////////////////
        clothing.append(ShoppingItem(img: UIImage(named: "cloth1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree"))
        //////////////////////////////////////////
        candy.append(ShoppingItem(img: UIImage(named: "candy1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        candy.append(ShoppingItem(img: UIImage(named: "candy2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree"))
        candy.append(ShoppingItem(img: UIImage(named: "candy3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        candy.append(ShoppingItem(img: UIImage(named: "candy4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away"))
        candy.append(ShoppingItem(img: UIImage(named: "candy5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree"))
        //////////////////////////////////////////////////
        presents.append(ShoppingItem(img: UIImage(named: "toy1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        presents.append(ShoppingItem(img: UIImage(named: "toy2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree"))
        presents.append(ShoppingItem(img: UIImage(named: "toy3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        presents.append(ShoppingItem(img: UIImage(named: "toy4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away"))
        presents.append(ShoppingItem(img: UIImage(named: "toy5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree"))
        //////////////////////////////////////////////////
        decorations.append(ShoppingItem(img: UIImage(named: "deco1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree"))
        /////////////////////////////////////////////////////////
        Desserts.append(ShoppingItem(img: UIImage(named: "food1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree"))
        ////////////////////////////////////////////////////////
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return categories.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CategoryCell
        
        cell.imageCell.image = categoriesImage[indexPath.row]

        if (indexPath.row == 1){
            cell.lableCell.text = "cart (\(cart.count))"
        }
        else{
            cell.lableCell.text = categories[indexPath.row]
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if (indexPath.row == 10){
            self.performSegue(withIdentifier: "toTableView", sender: indexPath)
        }
        else {
            self.performSegue(withIdentifier: "toTableView", sender: indexPath)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndexPath = sender as? NSIndexPath
        if let destination = segue.destination as? ShoppingItemsTVC {
            destination.cart = cart
            destination.delegate = self
            if ( selectedIndexPath?.row == 8){
                destination.items = xMasTree
            }
            else if ( selectedIndexPath?.row == 7){
                destination.items = drinks
            }
            else if ( selectedIndexPath?.row == 6){
                destination.items = presents
            }
            else if ( selectedIndexPath?.row == 5){
                destination.items = candy
            }
            else if ( selectedIndexPath?.row == 4){
                destination.items = clothing
            }
            else if ( selectedIndexPath?.row == 3){
                destination.items = Desserts
            }
            else if ( selectedIndexPath?.row == 9){
            }
            else if ( selectedIndexPath?.row == 2){
                destination.items = decorations
            }
            else if ( selectedIndexPath?.row == 1){
                destination.items = cart
            }
            else if ( selectedIndexPath?.row == 0){
                destination.items = recentOrders
            }
        }
    }
    
    func finishPassing(cart1: Array<ShoppingItem>?) {
        cart = cart1!
        self.collectionView.reloadData()
    }
    
}//end of ViewController

