//
//  FirstViewController.swift
//  whisk
//
//  Created by Luis Ferrer Labarca on 10/16/15.
//  Copyright © 2015 Whisk. All rights reserved.
//

import UIKit

class PantryViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var pantryTable: UITableView!
    @IBOutlet weak var newIngredient: UITextField!
    
    @IBAction func submitNewIngredient(sender: AnyObject) {
        
        let ingredient = Ingredient(name: newIngredient.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).capitalizedString, email: user!.email)
        
        if ingredient.name != "" {
            
            pantry.append(ingredient)
            
            newIngredient.text = ""
            
            pantryTable.reloadData()
        }
        
        
//        NSUserDefaults.standardUserDefaults().setObject(pantry, forKey: "pantry")
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
        
        return pantry.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Ingredient")
        
        cell.textLabel?.text = pantry[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            pantry.removeAtIndex(indexPath.row)
            
            pantryTable.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        shoppingCart.append(pantry[indexPath.row])
        
        pantry.removeAtIndex(indexPath.row)
        
        pantryTable.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        pantryTable.reloadData()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
   
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        self.view.endEditing(true)
        return true
    }
}

