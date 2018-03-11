//
//  ManagerViewController.swift
//  ShopeMe
//
//  Created by Mit Amin on 3/09/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var decorations = [ShoppingItem]()
    var Desserts = [ShoppingItem]()
    var clothing = [ShoppingItem]()
    var candy = [ShoppingItem]()
    var presents = [ShoppingItem]()
    var drinks = [ShoppingItem]()
    var xMasTree = [ShoppingItem]()
    var lights = [ShoppingItem]()
    var categories = [category]()
    var emptyItem = [ShoppingItem]()
    var pickerCat = [String]()
    let imagePickerController = UIImagePickerController()
    var cat :String = ""
    var name: String?
    var imag:UIImage?
    var price:Double?
    var des:String?
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var priceInput: UITextField!
    @IBOutlet weak var itemDescription: UITextField!
    @IBOutlet weak var pickImageBtn: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imag = image
        dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCat.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCat[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cat = pickerCat[row]
        print(cat)
    }
    
   
    @IBAction func onClickSubmit(_ sender: UIButton) {
        if cat == "New Category"{
            
                if !categories.contains(where: {$0.categoryName == nameInput.text!}){
                    categories.append(category(img: imag!, nam: nameInput.text!, catCon: emptyItem))
                }
                else {
                    createAlert(title:"Warning", message: "This category already exists")
                }
        }
        else if cat == ""{createAlert(title: "please pick", message: "pick a category by moving spinner")}
        else{
            let a = categories.filter { $0.categoryName == cat }
            a[0].categoryContents.append(ShoppingItem(img: imag!, nam: nameInput.text!, pric: Double(priceInput.text!)!, desc: itemDescription.text!, cat: cat))
        }
    }
    
    @IBAction func onClickPicImag(_ sender: UIButton) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameInput.delegate = self
        priceInput.delegate = self
        itemDescription.delegate = self
        
        pickerCat.append("New Category")
        for item in categories{
            if  item.categoryName != "Recent Orders" && item.categoryName != "Cart(0)" {
                self.pickerCat.append(item.categoryName)
                
            }
        }
        imagePickerController.delegate = self
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func createAlert (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}
