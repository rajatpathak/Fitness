//
//  Day_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD

var selected_Day_Exercise = Int()

class Day_ViewController: UIViewController {
    //    MARK:- IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    //    MARK:- vars
    let arr_HomeTitle = ["Dumbbell Side Lunge","Single-arm Neutral-grip Dubbell","Elbow Plank Pike Jacks","Barbell Hang Pull"]
    let arr_HomeIcons = ["workouts","excersizes","Diets","blog"]
    
    let arr_HomeContent = ["Beginner","Beginner","Intermediate","Advanced"]
    
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        SVProgressHUD.show()
        getDayWiseData()
        
        self.title = Model_Details.shared.str_Title
    }
    
    func getDayWiseData(){
        
        model_getDayWiseData.shared.bodypart_title = [String]()
        model_getDayWiseData.shared.day = [String]()
        model_getDayWiseData.shared.exercise_equipment = [String]()
        model_getDayWiseData.shared.exercise_image = [String]()
        model_getDayWiseData.shared.exercise_instructions = [String]()
        model_getDayWiseData.shared.exercise_reps = [String]()
        model_getDayWiseData.shared.exercise_rest = [String]()
        model_getDayWiseData.shared.exercise_sets = [String]()
        model_getDayWiseData.shared.exercise_tips = [String]()
        model_getDayWiseData.shared.exercise_title = [String]()
        model_getDayWiseData.shared.exercise_video = [String]()
        model_getDayWiseData.shared.id = [String]()
        model_getDayWiseData.shared.level_title = [String]()
        model_getDayWiseData.shared.workout_id = [String]()
//
        let url = "https://appentus.me/fitness/backend/json/data_day\(model_Helper_Details.refrence.selectedDay).php?wid=\(model_Helper_Details.refrence.workout_id)"
        api_func.api_alamofire_get(url: url) { (response) in
            let jsonResponse = convertToDictionary(text: response)
            let resultArray : NSArray = jsonResponse!["exercises"] as! NSArray
            for i in 0..<resultArray.count{
                let dict : NSDictionary = resultArray[i] as! NSDictionary
                model_getDayWiseData.shared.bodypart_title.append("\(dict["bodypart_title"]!)")
                model_getDayWiseData.shared.day.append("\(dict["day"]!)")
                model_getDayWiseData.shared.exercise_equipment.append("\(dict["exercise_equipment"]!)")
                model_getDayWiseData.shared.exercise_image.append(IMAGE_BASE_URL+"\(dict["exercise_image"]!)")
                model_getDayWiseData.shared.exercise_instructions.append("\(dict["exercise_instructions"]!)")
                model_getDayWiseData.shared.exercise_reps.append("\(dict["exercise_reps"]!)")
                model_getDayWiseData.shared.exercise_rest.append("\(dict["exercise_rest"]!)")
                model_getDayWiseData.shared.exercise_sets.append("\(dict["exercise_sets"]!)")
                model_getDayWiseData.shared.exercise_tips.append("\(dict["exercise_tips"]!)")
                model_getDayWiseData.shared.exercise_title.append("\(dict["exercise_title"]!)")
                model_getDayWiseData.shared.exercise_video.append("\(dict["exercise_video"]!)")
                model_getDayWiseData.shared.id.append("\(dict["id"]!)")
                model_getDayWiseData.shared.level_title.append("\(dict["level_title"]!)")
                model_getDayWiseData.shared.workout_id.append("\(dict["workout_id"]!)")
            }
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }

    //    MARK:- IBActions
    @IBAction func btn_Back(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
