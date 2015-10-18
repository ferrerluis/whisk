//
//  Model.swift
//  whisk
//
//  Created by Luis Ferrer Labarca on 10/17/15.
//  Copyright © 2015 Whisk. All rights reserved.
//

import Foundation

func JSONtoString(json: JSON, key: String) -> String {
    
    if let temp = json[key].string {
        
        return temp
    } else {
        
        return ""
    }
}

class Ingredient {
    
    var name: String
    var email: String
    
    init(jsonString: String) {
        
        let json = JSON(jsonString)
        
        name = JSONtoString(json, key: "name")
        email = JSONtoString(json, key: "email")
    }
    
    init(ingredientDict: NSDictionary) {
        
        name = ingredientDict["name"] as! String
        email = ingredientDict["email"] as! String
    }
    
    init(name: String, email: String) {
        
        self.name = name
        self.email = email
    }
    
    func toJSON() -> JSON {
        
        let dict = ["name": name, "email": email]
        
        return JSON(dict)
    }
    
    func toDict() -> NSDictionary {
        
        let dict = ["name": name, "email": email]

        return dict
    }
}

class User {
    
    var email: String
    var firstName: String
    var lastName: String
    
    init(jsonString: String) {
        
        let json = JSON(jsonString)
        
        email = JSONtoString(json, key: "email")
        firstName = JSONtoString(json, key: "first_name")
        lastName = JSONtoString(json, key: "last_name")
    }
    
    init(userDict: NSDictionary) {
        
        email = userDict["email"] as! String
        firstName = userDict["first_name"] as! String
        lastName = userDict["last_name"] as! String
    }
    
    init(email: String, firstName: String, lastName: String) {
        
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func toJSON() -> JSON {
        
        let dict = ["email": email, "first_name": firstName, "last_name": lastName]
        
        return JSON(dict)
    }
    
    func toDict() -> NSDictionary {
        
        let dict = ["email": email, "first_name": firstName, "last_name": lastName]
        
        return dict
    }
}

class Recipe {
    
    var title: String
    var ingredients: [String]
    var url: String
    
    init(title: String, ingredients: [String], url: String) {
        
        self.title = title
        self.ingredients = ingredients
        self.url = url
    }
}
  