//
//  LoginViewController.swift
//  whisk
//
//  Created by Luis Ferrer Labarca on 10/17/15.
//  Copyright © 2015 Whisk. All rights reserved.
//

import UIKit

var user: User?
var pantry = [Ingredient]()
var shoppingCart = [Ingredient]()

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        if NSUserDefaults.standardUserDefaults().objectForKey("pantry") != nil {
//            
//            pantry = NSUserDefaults.standardUserDefaults().objectForKey("pantry") as! [Ingredient]!
//        }
//        
//        if NSUserDefaults.standardUserDefaults().objectForKey("shoppingCart") != nil {
//            
//            shoppingCart = NSUserDefaults.standardUserDefaults().objectForKey("shoppingCart") as! [Ingredient]!
//        }
//        
//        if NSUserDefaults.standardUserDefaults().objectForKey("user") != nil {
//            
//            user = User(userDict: NSUserDefaults.standardUserDefaults().objectForKey("user") as! NSDictionary!)
//            presentViewController(PantryViewController(), animated: true, completion: nil)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
