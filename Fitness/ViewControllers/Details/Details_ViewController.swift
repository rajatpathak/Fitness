//
//  Details_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Details_ViewController: UIViewController {
    //    MARK:- IBOutlets
    @IBOutlet weak var tableview: UITableView!
    //    MARK:- vars
    var goalName = String()
    var levelName = String()
    var titleOfCell = String()
    var imagee = String()
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        selecedWorkoutId
//        selecedWorkout_Goal
//        selecedWorkout_Level
    }
    override func viewWillAppear(_ animated: Bool) {
//        model_Helper_Details.refrence.did
      goalName = model_Helper_Details.refrence.goal_title
//        model_Helper_Details.refrence.id
       levelName = model_Helper_Details.refrence.level_title
//        model_Helper_Details.refrence.workout_description
//        model_Helper_Details.refrence.workout_duration
//        model_Helper_Details.refrence.workout_goal
//        model_Helper_Details.refrence.workout_id
       imagee = model_Helper_Details.refrence.workout_image
//        model_Helper_Details.refrence.workout_level
      titleOfCell = model_Helper_Details.refrence.workout_title
        self.tableview.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- IBActions
    @IBAction func btn_Back(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
