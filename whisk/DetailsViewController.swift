//
//  DetailsViewController.swift
//  whisk
//
//  Created by Luis Ferrer Labarca on 10/17/15.
//  Copyright © 2015 Whisk. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func startRecipe(sender: AnyObject) {
        
        performSegueWithIdentifier("webSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = recipeTitle!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ingr!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Ingredient")
        
        cell.textLabel?.text = ingr![indexPath.row]
        
        return cell
    }
}