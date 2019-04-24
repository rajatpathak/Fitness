//
//  DietBreifView.swift
//  Fitness
//
//  Created by Love on 17/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class DietBreifView: UIViewController {

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var ViewThrew: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var calorie: UILabel!
    @IBOutlet weak var protien: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var carbs: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var serving: UILabel!
    @IBOutlet weak var cookTime: UILabel!
    @IBOutlet weak var bottomViewOne: UIView!
    @IBOutlet weak var botttomViewTwo: UIView!
    @IBOutlet weak var bottomViewThree: UIView!
    @IBOutlet weak var bottomViewTwoTextView: UITextView!
    @IBOutlet weak var bottomViewThreeTextView: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.viewOne.backgroundColor = UIColor(red: 252.0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            self.viewTwo.backgroundColor = UIColor.clear
            self.ViewThrew.backgroundColor = UIColor.clear
            self.bottomViewOne.isHidden = false
            self.botttomViewTwo.isHidden = true
            self.bottomViewThree.isHidden = true
            bottomViewTwoTextView.isEditable = false
            bottomViewThreeTextView.isEditable = false

        if DIET_MODEL_REFRENCE.selected_by == 1{
            print(DIET_MODEL_REFRENCE.selected_Index)
            print(DIET_MODEL_REFRENCE.category_title[DIET_MODEL_REFRENCE.selected_Index])
            
            image.downloadedFrom(link: DIET_MODEL_REFRENCE.diet_image[DIET_MODEL_REFRENCE.selected_Index])
            calorie.text = DIET_MODEL_REFRENCE.diet_calories[DIET_MODEL_REFRENCE.selected_Index]
            protien.text = DIET_MODEL_REFRENCE.diet_protein[DIET_MODEL_REFRENCE.selected_Index]
            fat.text = DIET_MODEL_REFRENCE.diet_fat[DIET_MODEL_REFRENCE.selected_Index]
            carbs.text = DIET_MODEL_REFRENCE.diet_carbs[DIET_MODEL_REFRENCE.selected_Index]
            titleText.text = DIET_MODEL_REFRENCE.diet_title[DIET_MODEL_REFRENCE.selected_Index]
            detailText.attributedText = DIET_MODEL_REFRENCE.diet_description[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
            serving.text = DIET_MODEL_REFRENCE.diet_servings[DIET_MODEL_REFRENCE.selected_Index]
            cookTime.text = DIET_MODEL_REFRENCE.diet_time[DIET_MODEL_REFRENCE.selected_Index]

            self.navBar.topItem?.title = DIET_MODEL_REFRENCE.category_title[DIET_MODEL_REFRENCE.selected_Index]
            bottomViewTwoTextView.attributedText = DIET_MODEL_REFRENCE.diet_ingredients[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
            bottomViewThreeTextView.attributedText = DIET_MODEL_REFRENCE.diet_directions[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString

        }
        else if DIET_MODEL_REFRENCE.selected_by == 2{
            print(DIET_MODEL_REFRENCE.selected_Index)
            print(DIET_MODEL_REFRENCE.selected_Index)
            print(DIET_MODEL_REFRENCE.category_title[DIET_MODEL_REFRENCE.selected_Index])
            image.downloadedFrom(link: DIET_MODEL_REFRENCE.diet_image[DIET_MODEL_REFRENCE.selected_Index])
            calorie.text = DIET_MODEL_REFRENCE.diet_calories[DIET_MODEL_REFRENCE.selected_Index]
            protien.text = DIET_MODEL_REFRENCE.diet_protein[DIET_MODEL_REFRENCE.selected_Index]
            fat.text = DIET_MODEL_REFRENCE.diet_fat[DIET_MODEL_REFRENCE.selected_Index]
            carbs.text = DIET_MODEL_REFRENCE.diet_carbs[DIET_MODEL_REFRENCE.selected_Index]
            titleText.text = DIET_MODEL_REFRENCE.diet_title[DIET_MODEL_REFRENCE.selected_Index]
            detailText.attributedText = DIET_MODEL_REFRENCE.diet_description[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
            serving.text = DIET_MODEL_REFRENCE.diet_servings[DIET_MODEL_REFRENCE.selected_Index]
            cookTime.text = DIET_MODEL_REFRENCE.diet_time[DIET_MODEL_REFRENCE.selected_Index]
            self.navBar.topItem?.title = DIET_MODEL_REFRENCE.category_title[DIET_MODEL_REFRENCE.selected_Index]
            bottomViewTwoTextView.attributedText = DIET_MODEL_REFRENCE.diet_ingredients[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
            bottomViewThreeTextView.attributedText = DIET_MODEL_REFRENCE.diet_directions[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
        }
        else if DIET_MODEL_REFRENCE.selected_by == 3{
            print(DIET_MODEL_REFRENCE.selected_Index)
            image.downloadedFrom(link: DIET_MODEL_REFRENCE.fav_diet_image[DIET_MODEL_REFRENCE.selected_Index])
            calorie.text = DIET_MODEL_REFRENCE.fav_diet_calories[DIET_MODEL_REFRENCE.selected_Index]
            protien.text = DIET_MODEL_REFRENCE.fav_diet_protein[DIET_MODEL_REFRENCE.selected_Index]
            fat.text = DIET_MODEL_REFRENCE.fav_diet_fat[DIET_MODEL_REFRENCE.selected_Index]
            carbs.text = DIET_MODEL_REFRENCE.fav_diet_carbs[DIET_MODEL_REFRENCE.selected_Index]
            titleText.text = DIET_MODEL_REFRENCE.fav_diet_title[DIET_MODEL_REFRENCE.selected_Index]
            detailText.attributedText = DIET_MODEL_REFRENCE.fav_diet_description[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
            serving.text = DIET_MODEL_REFRENCE.fav_diet_servings[DIET_MODEL_REFRENCE.selected_Index]
            cookTime.text = DIET_MODEL_REFRENCE.fav_diet_time[DIET_MODEL_REFRENCE.selected_Index]
            print(DIET_MODEL_REFRENCE.fav_diet_title[DIET_MODEL_REFRENCE.selected_Index])
            self.navBar.topItem?.title = DIET_MODEL_REFRENCE.fav_diet_title[DIET_MODEL_REFRENCE.selected_Index]
            bottomViewTwoTextView.attributedText = DIET_MODEL_REFRENCE.diet_ingredients[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
            bottomViewThreeTextView.attributedText = DIET_MODEL_REFRENCE.fav_diet_directions[DIET_MODEL_REFRENCE.selected_Index].html2AttributedString
        }
    }
    
    @IBAction func threeButtons(_ sender: UIButton) {
            if sender.tag == 1{
                self.viewOne.backgroundColor = UIColor(red: 252.0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                self.viewTwo.backgroundColor = UIColor.clear
                self.ViewThrew.backgroundColor = UIColor.clear
                self.bottomViewOne.isHidden = false
                self.botttomViewTwo.isHidden = true
                self.bottomViewThree.isHidden = true
            }
            else if sender.tag == 2{
                self.viewOne.backgroundColor = UIColor.clear
                self.viewTwo.backgroundColor = UIColor(red: 252.0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                self.ViewThrew.backgroundColor = UIColor.clear
                self.bottomViewOne.isHidden = true
                self.botttomViewTwo.isHidden = false
                self.bottomViewThree.isHidden = true
            }
            else{
                self.viewOne.backgroundColor = UIColor.clear
                self.viewTwo.backgroundColor = UIColor.clear
                self.ViewThrew.backgroundColor = UIColor(red: 252.0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                self.bottomViewOne.isHidden = true
                self.botttomViewTwo.isHidden = true
                self.bottomViewThree.isHidden = false
            }
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.navBar.topItem?.title = ""
        self.dismiss(animated: true, completion: nil)
    }
}
