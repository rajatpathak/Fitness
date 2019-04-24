
//  FatLoss_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD


var selecedWorkoutId = String()
var selecedWorkout_Goal = String()
var selecedWorkout_Level = String()

class FatLoss_ViewController: UIViewController {
    //    MARK:- IBOutlets
    
    //    MARK:- vars

    var exc_Image = [String]()
    var topTitle = [String]()
    var Set_title = [String]()
    var type = [String]()
    var workoutId = [String]()
    var workout_Goal = [String]()
    var workOut_Level = [String]()

    var did = [String]()
    var goal_title = [String]()
    var id = [String]()
    var level_title = [String]()
    var workout_description = [String]()
    var workout_duration = [String]()
    var workout_image = [String]()
    var workout_title = [String]()
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selected_Cell_title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.show()
        getData()
    }
    func getData(){
   
        model_Get_Data_Workouts.shared.did = [String]()
        model_Get_Data_Workouts.shared.goal_title = [String]()
        model_Get_Data_Workouts.shared.id = [String]()
        model_Get_Data_Workouts.shared.level_title = [String]()
        model_Get_Data_Workouts.shared.workout_description = [String]()
        model_Get_Data_Workouts.shared.workout_duration = [String]()
        model_Get_Data_Workouts.shared.workout_goal = [String]()
        model_Get_Data_Workouts.shared.workout_id = [String]()
        model_Get_Data_Workouts.shared.workout_image = [String]()
        model_Get_Data_Workouts.shared.workout_level = [String]()
        model_Get_Data_Workouts.shared.workout_title = [String]()

       exc_Image = [String]()
       topTitle = [String]()
       Set_title = [String]()
       type = [String]()
       workoutId = [String]()
       workout_Goal = [String]()
       workOut_Level = [String]()
        
        did = [String]()
        goal_title = [String]()
        id = [String]()
        level_title = [String]()
        workout_description = [String]()
        workout_duration = [String]()
        workout_image = [String]()
        workout_title = [String]()
        
        api_func.api_alamofire_get(url: API_BASE_URL+GET_DATA_WORKOUTS) { (response) in
            let responseJSON = convertToDictionary(text: response)
            let result : NSArray = responseJSON!["workouts"] as! NSArray
            for i in 0..<result.count{
                let dict : NSDictionary = result[i] as! NSDictionary
                model_Get_Data_Workouts.shared.did.append("\(dict["did"]!)")
                model_Get_Data_Workouts.shared.goal_title.append("\(dict["goal_title"]!)")
                model_Get_Data_Workouts.shared.id.append("\(dict["id"]!)")
                model_Get_Data_Workouts.shared.level_title.append("\(dict["level_title"]!)")
                model_Get_Data_Workouts.shared.workout_description.append("\(dict["workout_description"]!)")
                model_Get_Data_Workouts.shared.workout_duration.append("\(dict["workout_duration"]!)")
                model_Get_Data_Workouts.shared.workout_goal.append("\(dict["workout_goal"]!)")
                model_Get_Data_Workouts.shared.workout_id.append("\(dict["workout_id"]!)")
                model_Get_Data_Workouts.shared.workout_image.append("\(dict["workout_image"]!)")
                model_Get_Data_Workouts.shared.workout_level.append("\(dict["workout_level"]!)")
                model_Get_Data_Workouts.shared.workout_title.append("\(dict["workout_title"]!)")

            }
            if goalOrLevel == "1"{
                //            selected_Goal_Or_Level
                for i in 0..<model_Get_Data_Workouts.shared.workout_goal.count{
                    if model_Get_Data_Workouts.shared.workout_goal[i] == selected_Goal_Or_Level{
                        self.exc_Image.append(IMAGE_BASE_URL+model_Get_Data_Workouts.shared.workout_image[i])
                        self.topTitle.append(model_Get_Data_Workouts.shared.goal_title[i])
                        self.Set_title.append(model_Get_Data_Workouts.shared.workout_title[i])
                        self.type.append(model_Get_Data_Workouts.shared.level_title[i])
                        self.workoutId.append(model_Get_Data_Workouts.shared.workout_id[i])
                        self.workout_Goal.append(model_Get_Data_Workouts.shared.workout_goal[i])
                        self.workOut_Level.append(model_Get_Data_Workouts.shared.workout_level[i])
                        self.did.append(model_Get_Data_Workouts.shared.did[i])
                        self.goal_title.append(model_Get_Data_Workouts.shared.goal_title[i])
                        self.id.append(model_Get_Data_Workouts.shared.id[i])
                        self.level_title.append(model_Get_Data_Workouts.shared.level_title[i])
                        self.workout_description.append(model_Get_Data_Workouts.shared.workout_description[i])
                        self.workout_duration.append(model_Get_Data_Workouts.shared.workout_duration[i])
                        self.workout_image.append(model_Get_Data_Workouts.shared.workout_image[i])
                        self.workout_title.append(model_Get_Data_Workouts.shared.workout_title[i])
                    }
                }
                

            }
            else{
                for i in 0..<model_Get_Data_Workouts.shared.workout_goal.count{
                    if model_Get_Data_Workouts.shared.workout_level[i] == selected_Goal_Or_Level{
                        self.exc_Image.append(IMAGE_BASE_URL+model_Get_Data_Workouts.shared.workout_image[i])
                        self.topTitle.append(model_Get_Data_Workouts.shared.goal_title[i])
                        self.Set_title.append(model_Get_Data_Workouts.shared.workout_title[i])
                        self.type.append(model_Get_Data_Workouts.shared.level_title[i])
                        self.workoutId.append(model_Get_Data_Workouts.shared.workout_id[i])
                        self.workout_Goal.append(model_Get_Data_Workouts.shared.workout_goal[i])
                        self.workOut_Level.append(model_Get_Data_Workouts.shared.workout_level[i])
                        self.did.append(model_Get_Data_Workouts.shared.did[i])
                        self.goal_title.append(model_Get_Data_Workouts.shared.goal_title[i])
                        self.id.append(model_Get_Data_Workouts.shared.id[i])
                        self.level_title.append(model_Get_Data_Workouts.shared.level_title[i])
                        self.workout_description.append(model_Get_Data_Workouts.shared.workout_description[i])
                        self.workout_duration.append(model_Get_Data_Workouts.shared.workout_duration[i])
                        self.workout_image.append(model_Get_Data_Workouts.shared.workout_image[i])
                        self.workout_title.append(model_Get_Data_Workouts.shared.workout_title[i])
                    }
                }
            }
            SVProgressHUD.dismiss()
            self.tableview.reloadData()

        }
    }
    
    
    
    //    MARK:- IBActions
        @IBAction func btn_Back(_ sender:UIButton) {
            self.navigationController?.popViewController(animated: true)
        }
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
