//
//  Goals_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD

var selected_Goal_Or_Level = String()
var selected_Cell_title = String()

class Goals_ViewController: UIViewController {
    //    MARK:- IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    //    MARK:- vars
    var itemName = [String]()
    var itemImage = [String]()
    var itemID = [String]()
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        getGoalRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Model_Workout.shared.str_Title
    }
    
    //    MARK:- IBActions
    @IBAction func btn_Back(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //    MARK:- Custom functions
    

    
    //    MARK:- Finish
}
