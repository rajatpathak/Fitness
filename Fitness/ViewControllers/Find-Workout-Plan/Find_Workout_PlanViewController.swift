//
//  Find_Workout_PlanViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Find_Workout_PlanViewController: UIViewController {
    //    MARK:- IBOutlets
    @IBOutlet weak var txt_Goals:UITextField!
    @IBOutlet weak var txt_Level:UITextField!

    @IBOutlet weak var btn_Search:UIButton!

    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func_TextField_Border_Padding(to: txt_Goals)
        func_TextField_Border_Padding(to: txt_Level)
        
        func_Button_Round(to: btn_Search, with: 6)
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
