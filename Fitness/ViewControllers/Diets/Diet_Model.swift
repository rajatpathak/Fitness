//
//  Diet_Model.swift
//  Fitness
//
//  Created by Love on 18/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation

class Diet_Model {
    
    static let Diet_Model_SingleTon = Diet_Model()
    
    var diet_id = [String]()
    var diet_title = [String]()
    var diet_description = [String]()
    var diet_ingredients = [String]()
    var diet_category = [String]()
    var diet_directions = [String]()
    var diet_calories = [String]()
    var diet_carbs = [String]()
    var diet_protein = [String]()
    var diet_fat = [String]()
    var diet_time = [String]()
    var diet_servings = [String]()
    var diet_image = [String]()
    var diet_featured = [String]()
    var category_title = [String]()
    var id = [String]()
    
    var fav_diet_id = [String]()
    var fav_diet_title = [String]()
    var fav_diet_description = [String]()
    var fav_diet_ingredients = [String]()
    var fav_diet_category = [String]()
    var fav_diet_directions = [String]()
    var fav_diet_calories = [String]()
    var fav_diet_carbs = [String]()
    var fav_diet_protein = [String]()
    var fav_diet_fat = [String]()
    var fav_diet_time = [String]()
    var fav_diet_servings = [String]()
    var fav_diet_image = [String]()
    var fav_diet_featured = [String]()
    var fav_category_title = [String]()
    var selected_by = -1
    var selected_Index = -1
}
