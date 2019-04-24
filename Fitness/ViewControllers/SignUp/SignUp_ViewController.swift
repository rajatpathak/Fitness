//
//  SignUp_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUp_ViewController: UIViewController {
    //    MARK:- IBOutlets
    @IBOutlet weak var txt_Name:UITextField!
    @IBOutlet weak var txt_Email:UITextField!
    @IBOutlet weak var txt_Password:UITextField!
    @IBOutlet weak var txt_ConfirmPassword:UITextField!

    @IBOutlet weak var btn_SignUp:UIButton!

    @IBOutlet weak var img_Logo:UIImageView!

    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func_SetDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.barTintColor = UIColor .func_AppRedColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- IBActions
    @IBAction func btn_Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signup(_ sender: UIButton) {
        let isEmailValid = isValidEmail(testStr: txt_Email.text!)

        if txt_Name.text! == ""{
           SVProgressHUD.showError(withStatus: "Enter Name")
        }
        else if txt_Email.text! == ""{
            SVProgressHUD.showError(withStatus: "Enter Email")
        }
        else if txt_Password.text == ""{
            SVProgressHUD.showError(withStatus: "Enter Password")
        }
        else if txt_ConfirmPassword.text! == ""{
            SVProgressHUD.showError(withStatus: "Confirm Password Cannot be Blank")
        }
        else if txt_ConfirmPassword.text! != txt_Password.text!{
            SVProgressHUD.showError(withStatus: "Password And Confirm Password Do Not Match")
        }
        else if isEmailValid == false{
            SVProgressHUD.showError(withStatus: "email is not in correct format")
        }
        else{
            self.signup()
        }
    }
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
