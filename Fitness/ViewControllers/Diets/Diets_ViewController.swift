//
//  Diets_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD
class Diets_ViewController: UIViewController {


    @IBOutlet weak var tableview: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.show()
        get_Diet_Data()

    }
    @IBAction func back (_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
