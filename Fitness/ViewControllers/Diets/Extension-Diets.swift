//
//  Extension-Diets.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SVProgressHUD

extension Diets_ViewController :UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 240
        } else if indexPath.row == 1 || indexPath.row == 3 {
           return 50
        }else if indexPath.row == 2 {
            return 160
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DIET_MODEL_REFRENCE.fav_diet_title.count + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if indexPath.row == 0 {
            
            let cell_First = tableView.dequeueReusableCell(withIdentifier: "cell_First", for:indexPath) as! Diets_TableViewCell
            
            cell_First.coll_Cell_First.delegate = self
            cell_First.coll_Cell_First.dataSource = self
            cell_First.coll_Cell_First.tag = 1
            cell_First.coll_Cell_First.reloadData()
            return cell_First
        } else if indexPath.row == 1 {
            let cell_Categories_Header = tableView.dequeueReusableCell(withIdentifier: "cell_Categories_Header", for:indexPath)
            
            return cell_Categories_Header
        } else if indexPath.row == 2 {
            let cell_Categories = tableView.dequeueReusableCell(withIdentifier: "cell_Categories", for:indexPath) as! Categories_TableViewCell
            
            cell_Categories.coll_Cell_Categories.delegate = self
            cell_Categories.coll_Cell_Categories.dataSource = self
            cell_Categories.coll_Cell_Categories.tag = 2
            cell_Categories.coll_Cell_Categories.reloadData()
            return cell_Categories
        } else if indexPath.row == 3 {
            let cell_Featured_Recipes = tableView.dequeueReusableCell(withIdentifier: "cell_Featured_Recipes", for:indexPath)
            
            return cell_Featured_Recipes
        } else {
            let cell_FeaturedRecipes_List = tableView.dequeueReusableCell(withIdentifier: "cell_FeaturedRecipes_List", for:indexPath) as! FeaturedRecipes_List_TableViewCell
            let index = indexPath.row - 4
            cell_FeaturedRecipes_List.calories.text = "\(DIET_MODEL_REFRENCE.fav_diet_calories[index]) Cal"
            cell_FeaturedRecipes_List.name.text = DIET_MODEL_REFRENCE.fav_diet_title[index]
            cell_FeaturedRecipes_List.img_Diet.contentMode = .scaleToFill

            cell_FeaturedRecipes_List.img_Diet.downloadedFrom(link: DIET_MODEL_REFRENCE.fav_diet_image[index])
            return cell_FeaturedRecipes_List
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {

        } else if indexPath.row == 1 {
            
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            
        } else {
            let index = indexPath.row - 4
            DIET_MODEL_REFRENCE.selected_by = 3
            DIET_MODEL_REFRENCE.selected_Index = index
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DietBreifView") as! DietBreifView
            self.present(vc, animated: true, completion: nil)
            
        }
    }
}


extension Diets_ViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize (width: collectionView.frame.size.width , height: 240)
        } else {
            return CGSize (width: collectionView.frame.size.width/2 , height: 160)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 1{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return DIET_MODEL_REFRENCE.category_title.count
            
        }
        else{
            return DIET_MODEL_REFRENCE.category_title.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "cell_First", for: indexPath) as! cell_First
            cell.image.downloadedFrom(link: DIET_MODEL_REFRENCE.diet_image[indexPath.row])
            cell.image.contentMode = .scaleToFill
            cell.title.text = DIET_MODEL_REFRENCE.category_title[indexPath.row]
            cell.detail.text = DIET_MODEL_REFRENCE.diet_title[indexPath.row]
            cell.servings.text = "Servings: \(DIET_MODEL_REFRENCE.diet_servings[indexPath.row]) | Cook Time: \(DIET_MODEL_REFRENCE.diet_time[indexPath.row]) "
            return cell
        } else {
            let cell_Categories = collectionView .dequeueReusableCell(withReuseIdentifier: "cell_Categories", for: indexPath) as! cell_Categories
            
            cell_Categories.name.text = DIET_MODEL_REFRENCE.category_title[indexPath.row]
            return cell_Categories
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if collectionView.tag == 1{
            DIET_MODEL_REFRENCE.selected_by = 1
            DIET_MODEL_REFRENCE.selected_Index = indexPath.row
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DietBreifView") as! DietBreifView
            self.present(vc, animated: true, completion: nil)
            
        }
        else{
            DIET_MODEL_REFRENCE.selected_by = 2
            DIET_MODEL_REFRENCE.selected_Index = indexPath.row
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DietBreifView") as! DietBreifView
            self.present(vc, animated: true, completion: nil)        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}
extension Diets_ViewController{
    func get_Diet_Data(){
        
        DIET_MODEL_REFRENCE.id.removeAll()
        DIET_MODEL_REFRENCE.diet_id.removeAll()
        DIET_MODEL_REFRENCE.diet_title.removeAll()
        DIET_MODEL_REFRENCE.diet_description.removeAll()
        DIET_MODEL_REFRENCE.diet_ingredients.removeAll()
        DIET_MODEL_REFRENCE.diet_category.removeAll()
        DIET_MODEL_REFRENCE.diet_directions.removeAll()
        DIET_MODEL_REFRENCE.diet_calories.removeAll()
        DIET_MODEL_REFRENCE.diet_carbs.removeAll()
        DIET_MODEL_REFRENCE.diet_protein.removeAll()
        DIET_MODEL_REFRENCE.diet_fat.removeAll()
        DIET_MODEL_REFRENCE.diet_time.removeAll()
        DIET_MODEL_REFRENCE.diet_servings.removeAll()
        DIET_MODEL_REFRENCE.diet_image.removeAll()
        DIET_MODEL_REFRENCE.diet_featured.removeAll()
        DIET_MODEL_REFRENCE.category_title.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_id.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_title.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_description.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_ingredients.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_category.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_directions.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_calories.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_carbs.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_protein.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_fat.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_time.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_servings.removeAll()
        DIET_MODEL_REFRENCE.fav_diet_image.removeAll()
        DIET_MODEL_REFRENCE.fav_category_title.removeAll()
        
        
        let Param : [String:Any] = ["":""]
        Alamofire.request(API_DIETS, method: .get, parameters: Param).validate().responseString { (response) in
            switch response.result{
            case .success:
                let jsonDict = convertToDictionary(text: response.result.value!)
                    let result : NSArray = jsonDict!["diets"] as! NSArray
                    for i in 0..<result.count{
                        let arrayOfData  : [String:Any] = result[i] as! [String : Any]
                        
                        DIET_MODEL_REFRENCE.id.append("\(arrayOfData["id"]!)")
                        DIET_MODEL_REFRENCE.diet_id.append("\(arrayOfData["diet_id"]!)")
                        DIET_MODEL_REFRENCE.diet_title.append("\(arrayOfData["diet_title"]!)")
                        DIET_MODEL_REFRENCE.diet_description.append("\(arrayOfData["diet_description"]!)")
                        DIET_MODEL_REFRENCE.diet_ingredients.append("\(arrayOfData["diet_ingredients"]!)")
                        DIET_MODEL_REFRENCE.diet_category.append("\(arrayOfData["diet_category"]!)")
                        DIET_MODEL_REFRENCE.diet_directions.append("\(arrayOfData["diet_directions"]!)")
                        DIET_MODEL_REFRENCE.diet_calories.append("\(arrayOfData["diet_calories"]!)")
                        DIET_MODEL_REFRENCE.diet_carbs.append("\(arrayOfData["diet_carbs"]!)")
                        DIET_MODEL_REFRENCE.diet_protein.append("\(arrayOfData["diet_protein"]!)")
                        DIET_MODEL_REFRENCE.diet_fat.append("\(arrayOfData["diet_fat"]!)")
                        DIET_MODEL_REFRENCE.diet_time.append("\(arrayOfData["diet_time"]!)")
                        DIET_MODEL_REFRENCE.diet_servings.append("\(arrayOfData["diet_servings"]!)")
                        DIET_MODEL_REFRENCE.diet_image.append("\(IMAGE_BASE_URL)\(arrayOfData["diet_image"]!)")
                        DIET_MODEL_REFRENCE.diet_featured.append("\(arrayOfData["diet_featured"]!)")
                        DIET_MODEL_REFRENCE.category_title.append("\(arrayOfData["category_title"]!)")
                        
                        if DIET_MODEL_REFRENCE.diet_featured[i] == "1"{
                            DIET_MODEL_REFRENCE.fav_diet_id.append("\(arrayOfData["diet_id"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_title.append("\(arrayOfData["diet_title"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_description.append("\(arrayOfData["diet_description"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_ingredients.append("\(arrayOfData["diet_ingredients"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_category.append("\(arrayOfData["diet_category"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_directions.append("\(arrayOfData["diet_directions"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_calories.append("\(arrayOfData["diet_calories"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_carbs.append("\(arrayOfData["diet_carbs"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_protein.append("\(arrayOfData["diet_protein"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_fat.append("\(arrayOfData["diet_fat"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_time.append("\(arrayOfData["diet_time"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_servings.append("\(arrayOfData["diet_servings"]!)")
                            DIET_MODEL_REFRENCE.fav_diet_image.append("\(IMAGE_BASE_URL)\(arrayOfData["diet_image"]!)")
                            DIET_MODEL_REFRENCE.fav_category_title.append("\(arrayOfData["category_title"]!)")
                        }
                    }
                
                self.tableview.reloadData()
                SVProgressHUD.dismiss()
                break
            case .failure:
                SVProgressHUD.dismiss()
                break
            }
        }
    }
}
