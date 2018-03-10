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

    var recentOrders = [ShoppingItem]()
    var cart = [ShoppingItem]()
    var decorations = [ShoppingItem]()
    var Desserts = [ShoppingItem]()
    var clothing = [ShoppingItem]()
    var candy = [ShoppingItem]()
    var presents = [ShoppingItem]()
    var drinks = [ShoppingItem]()
    var xMasTree = [ShoppingItem]()
    var lights = [ShoppingItem]()

    var categories = [category]()
    var cartDictionary: [String: Array<ShoppingItem>] = [:]


    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self

        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Christmas Tree"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Christmas Tree"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Christmas Tree"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Christmas Tree"))
        xMasTree.append(ShoppingItem(img: UIImage(named: "tree5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Christmas Tree"))
        ////////////////////////////////////////////////////////////////////////////
        drinks.append(ShoppingItem(img: UIImage(named: "drink1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Drinks"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Drinks"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Drinks"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Drinks"))
        drinks.append(ShoppingItem(img: UIImage(named: "drink5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Drinks"))
        ////////////////////////////////////////////////////////
        clothing.append(ShoppingItem(img: UIImage(named: "cloth1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Clothing"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Clothing"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Clothing"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Clothing"))
        clothing.append(ShoppingItem(img: UIImage(named: "cloth5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Clothing"))
        //////////////////////////////////////////
        candy.append(ShoppingItem(img: UIImage(named: "candy1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Candy"))
        candy.append(ShoppingItem(img: UIImage(named: "candy2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Candy"))
        candy.append(ShoppingItem(img: UIImage(named: "candy3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Candy"))
        candy.append(ShoppingItem(img: UIImage(named: "candy4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Candy"))
        candy.append(ShoppingItem(img: UIImage(named: "candy5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Candy"))
        //////////////////////////////////////////////////
        presents.append(ShoppingItem(img: UIImage(named: "toy1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Presents"))
        presents.append(ShoppingItem(img: UIImage(named: "toy2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Presents"))
        presents.append(ShoppingItem(img: UIImage(named: "toy3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Presents"))
        presents.append(ShoppingItem(img: UIImage(named: "toy4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Presents"))
        presents.append(ShoppingItem(img: UIImage(named: "toy5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Presents"))
        //////////////////////////////////////////////////
        decorations.append(ShoppingItem(img: UIImage(named: "deco1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Decorations"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Decorations"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Decorations"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Decorations"))
        decorations.append(ShoppingItem(img: UIImage(named: "deco5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Decorations"))
        /////////////////////////////////////////////////////////
        Desserts.append(ShoppingItem(img: UIImage(named: "food1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Desserts"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Desserts"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Desserts"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Desserts"))
        Desserts.append(ShoppingItem(img: UIImage(named: "food5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Desserts"))
        ////////////////////////////////////////////////////////
        lights.append(ShoppingItem(img: UIImage(named: "light1")!, nam: "Natural Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Lights"))
        lights.append(ShoppingItem(img: UIImage(named: "light2")!, nam: "Smile Tree", pric: 11.49, desc: "The fancy tree", cat: "Lights"))
        lights.append(ShoppingItem(img: UIImage(named: "light3")!, nam: "Premium Tree", pric: 1.49, desc: "Natural tree is clean and fresh from the forest with no decorations", cat: "Lights"))
        lights.append(ShoppingItem(img: UIImage(named: "light4")!, nam: "Inflatable Tree", pric: 11.49, desc: "The will never rot away", cat: "Lights"))
        lights.append(ShoppingItem(img: UIImage(named: "light5")!, nam: "Simple Tree", pric: 11.49, desc: "The no fancy colors on this tree", cat: "Lights"))
        ////////////////////////////
        categories.append(category(img: UIImage(named: "Recent Orders")!, nam: "Recent Orders", catCon: recentOrders))
        categories.append(category(img: UIImage(named: "Cart")!, nam: "Cart(\(cart.count)", catCon: cart))
        categories.append(category(img: UIImage(named: "Decorations")!, nam: "Decorations", catCon: decorations))
        categories.append(category(img: UIImage(named: "Desserts")!, nam: "Desserts", catCon: Desserts))
        categories.append(category(img: UIImage(named: "Clothing")!, nam: "Clothing", catCon: clothing))
        categories.append(category(img: UIImage(named: "Candy")!, nam: "Candy", catCon: candy))
        categories.append(category(img: UIImage(named: "Presents")!, nam: "Presents", catCon: presents))
        categories.append(category(img: UIImage(named: "Drinks")!, nam: "Drinks", catCon: drinks))
        categories.append(category(img: UIImage(named: "Christmas Trees")!, nam: "Christmas Trees", catCon: xMasTree))
        categories.append(category(img: UIImage(named: "Lights")!, nam: "Lights", catCon: lights))

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return categories.count
    }

    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CategoryCell

        cell.imageCell.image = categories[indexPath.row].categoryImage

        if (indexPath.row == 1){
            cell.lableCell.text = "cart (\(cart.count))"
        }
        else{
            cell.lableCell.text = categories[indexPath.row].categoryName
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if (indexPath.row == 1){
            self.performSegue(withIdentifier: "toCart", sender: indexPath)
        }
        else if (indexPath.row == 0){
            self.performSegue(withIdentifier: "toRecentOrder", sender: indexPath)
        }
        else {
            self.performSegue(withIdentifier: "toTableView", sender: indexPath)
        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndexPath = sender as? NSIndexPath
                if let destination = segue.destination as? ShoppingItemsTVC {
                    destination.cart = cart
                    destination.section = categories[(selectedIndexPath?.row)!].categoryName
                    destination.delegate = self
                    destination.items = categories[(selectedIndexPath?.row)!].categoryContents
                    destination.cartDict = cartDictionary
                }
        if let destination = segue.destination as? CartTVC {
            destination.cart = cart
        }

    }// end of prepare for segue

    func finishPassing(cart1: Array<ShoppingItem>?, cartDict:[String: Array<ShoppingItem>]?) {
        cart = cart1!
        cartDictionary = cartDict!
        for (key,value) in cartDict! {
        }
        self.collectionView.reloadData()
    }
    
}//end of ViewController

