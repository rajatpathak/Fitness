//
//  First_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class First_ViewController: UIViewController {
    //    MARK:- IBOutlets
    @IBOutlet weak var btn_Login:UIButton!
    @IBOutlet weak var btn_SignUp:UIButton!

    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if fitnessUserDefaults.sharedInstance.KeepLogin == "1"{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuController")
            self.present(vc!, animated: true, completion: nil)
        }
        else{
            
        }
        func_SetDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    //    MARK:- IBActions
    @IBAction func btn_Login(_ sender: Any) {
        
        let login_VC = self.storyboard?.instantiateViewController(withIdentifier: "Login_ViewController")
        self.navigationController?.pushViewController(login_VC!, animated: true)
    }
    
    @IBAction func btn_SignUp(_ sender: Any) {
        
        let signUp_VC = self.storyboard?.instantiateViewController(withIdentifier: "SignUp_ViewController")
        self.navigationController?.pushViewController(signUp_VC!, animated: true)
    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
