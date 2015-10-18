//
//  ConcoctionViewController.swift
//  whisk
//
//  Created by Luis Ferrer Labarca on 10/16/15.
//  Copyright © 2015 Whisk. All rights reserved.
//

import UIKit
import Alamofire

var concoctions = [Recipe]()
let appID = "0e88eb62"
let appKey = "b11e714572f1521175eb77f781db19f5"

var recipeTitle: String?
var ingr: [String]?
var url: String?

class ConcoctionViewController: UIViewController {
        
    @IBOutlet weak var concoctionTable: UITableView!
    
    @IBAction func refreshConcoction(sender: AnyObject) {
        
        concoctions = []
        fetchConcoctions()
    }
    
    func fetchConcoctions() {
        
        concoctions = []
        
        let url = "https://api.yummly.com/v1/api/recipes"
        
        var search = ""
        
        for ingredient in pantry {
            
            search += ingredient.name + "+"
        }
        
        let query = ["_app_id": appID, "_app_key": appKey, "q": search]
        
        Alamofire.request(.GET, url, parameters: query)
            .response { (request, response, data, error) in
                
                let json = JSON(data: data!)
                
                for match in json["matches"].array! {
                    
                    var ingredients = [String]()
                    
                    for ingredient in match["ingredients"].array! {
                        
                        ingredients.append(ingredient.string!)
                    }
                    
                    let title = match["recipeName"].string!
                    let url = "https://www.yummly.com/recipe/" +  match["id"].string!
                    
                    print(title)
                    
                    concoctions.append(Recipe(title: title, ingredients: ingredients, url: url))
                    
                }
                
        self.concoctionTable.reloadData()
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        recipeTitle = concoctions[indexPath.row].title
        ingr = concoctions[indexPath.row].ingredients
        url = concoctions[indexPath.row].url
        
        performSegueWithIdentifier("detailsSegue", sender: self)
    }
    
    override func viewDidAppear(animated: Bool) {
            
            fetchConcoctions()
            concoctionTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return concoctions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Recipe")
        
        cell.textLabel?.text = concoctions[indexPath.row].title
        
        return cell
    }
}

