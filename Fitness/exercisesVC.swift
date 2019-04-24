//
//  exercisesVC.swift
//  Fitness
//
//  Created by Love on 18/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

var senderOfWorkouts = String()

class exercisesVC: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        senderOfWorkouts = "-1"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backk(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bodyParts(_ sender: UIButton) {
        senderOfWorkouts = "1"
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "Bodyparts_ViewController") as! Bodyparts_ViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func equipments(_ sender: UIButton) {
        senderOfWorkouts = "2"
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "equipments") as! equipments
        self.present(vc, animated: true, completion: nil)
    }
    
  

}
