//
//  SecondViewController.swift
//  whisk
//
//  Created by Luis Ferrer Labarca on 10/16/15.
//  Copyright © 2015 Whisk. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var newListItem: UITextField!
    @IBOutlet weak var shoppingCartTable: UITableView!
    
    @IBAction func submitNewListItem(sender: AnyObject) {
        
        let ingredient = Ingredient(name: newListItem.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).capitalizedString, email: user!.email)
        
        if ingredient.name != "" {
            
            shoppingCart.append(ingredient)

            newListItem.text = ""

            shoppingCartTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shoppingCart.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Ingredient")
        
        cell.textLabel?.text = shoppingCart[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            shoppingCart.removeAtIndex(indexPath.row)
            
            shoppingCartTable.reloadData()
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        pantry.append(shoppingCart[indexPath.row])
        
        shoppingCart.removeAtIndex(indexPath.row)
        
        shoppingCartTable.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        shoppingCartTable.reloadData()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        self.view.endEditing(true)
        return true
    }
}

