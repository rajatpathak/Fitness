//
//  Menu_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Menu_ViewController: UIViewController {
    //    MARK:- IBOutlets
    
    //    MARK:- vars
            let arr_MenuTitle = ["","Workouts","Exercises","Diets","Blog","Quotes","Profile","Settings","Sign Out"]
    
    //    MARK:- VC's life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- IBActions
    @IBAction func btn_Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
