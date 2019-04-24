//
//  Workout_ViewController.swift
//  Fitness
//  Created by Raja Vikram singh on 08/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.


import UIKit

var goalOrLevel = String()

class Workout_ViewController: UIViewController {
    //    MARK:- IBOutlets
        @IBOutlet weak var lbl_Goals:UILabel!
        @IBOutlet weak var lbl_Level:UILabel!

    
    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Model_Home.shared.str_Title
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- IBActions
   @IBAction func btn_Back(_ sender:UIButton) {
        if Model_SideMenu.shared.str_Dismiss_Pop == "pop" {
            let arr_VCs =  self.navigationController?.viewControllers
            self.navigationController?.popToViewController(arr_VCs![0], animated: true)
        } else if Model_SideMenu.shared.str_Dismiss_Pop == "dismiss" {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btn_Goals(_ sender:UIButton) {
        Model_Workout.shared.str_Title = lbl_Goals.text
        goalOrLevel = "1"
        let goal_VC = self.storyboard?.instantiateViewController(withIdentifier: "Goals_ViewController")
        self.navigationController?.pushViewController(goal_VC!, animated: true)
    }
    
    @IBAction func btn_Levels(_ sender:UIButton) {
         Model_Workout.shared.str_Title = lbl_Level.text
        goalOrLevel = "2"
        let goal_VC = self.storyboard?.instantiateViewController(withIdentifier: "Goals_ViewController")
        self.navigationController?.pushViewController(goal_VC!, animated: true)
    }

    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
