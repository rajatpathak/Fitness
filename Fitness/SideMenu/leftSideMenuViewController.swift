//
//  leftSideMenuViewController.swift
//  Fitness
//
//  Created by Love on 04/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class leftSideMenuViewController: UIViewController {
    //    MARK:- IBOutlets
    
    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


    
    //    MARK:- IBActions
    @IBAction func signout(_ sender: UIButton) {
        self.view.window?.rootViewController?.presentedViewController!.dismiss(animated: true, completion: {
                fitnessUserDefaults.sharedInstance.userId = ""
                fitnessUserDefaults.sharedInstance.user_name = ""
                fitnessUserDefaults.sharedInstance.user_Password = ""
                fitnessUserDefaults.sharedInstance.user_email = ""
                fitnessUserDefaults.sharedInstance.KeepLogin = "0"
                fitnessUserDefaults.sharedInstance.retriveUserFromUserDefaults()
            })

        
        
        
    }
    @IBAction func blog(_ sender: UIButton) {
        sideMenuController?.hideMenu()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Blogs_ViewController") as! Blogs_ViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func exercise(_ sender: UIButton) {
        sideMenuController?.hideMenu()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "exercisesVC")
 as! exercisesVC
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func Diets(_ sender: UIButton) {
        sideMenuController?.hideMenu()
        let vcDiet = self.storyboard?.instantiateViewController(withIdentifier: "Diets_ViewController") as! Diets_ViewController
        self.present(vcDiet, animated: true, completion: nil)
    }
    @IBAction func btn_Workout(to button: UIButton) {
        sideMenuController?.hideMenu()
        Model_SideMenu.shared.str_Dismiss_Pop = "dismiss"
        let working_VC = self.storyboard?.instantiateViewController(withIdentifier: "Workout_NavigationController")
        self.present(working_VC!, animated: true, completion: nil)
    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
