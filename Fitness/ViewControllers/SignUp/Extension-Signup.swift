//
//  Extension-Signup.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SVProgressHUD

extension SignUp_ViewController {
    
    func func_SetDesign()  {
        
        func_AddPaddingAndBorder_TextField(to: txt_Name)
        func_AddPaddingAndBorder_TextField(to: txt_Email)
        func_AddPaddingAndBorder_TextField(to: txt_Password)
        func_AddPaddingAndBorder_TextField(to: txt_ConfirmPassword)
        
        func_Button_Border(to: btn_SignUp)
        
        img_Logo.layer.cornerRadius = 4
        img_Logo.clipsToBounds = true
    }
    
     func signup(){
        
        SVProgressHUD.show()
        let parameter : [String:Any] = ["name":"\(self.txt_Name.text!)","_token":"\(API_SECURE_TOKEN)","email":"\(self.txt_Email.text!)","password":"\(self.txt_Password.text!)","fcm_token":"","device_type":"\(DEVIE_TYPE)"] as [String:Any]

        Alamofire.request(API_SIGNUP_URL, method: .post, parameters: parameter).validate().responseString { (response) in
            switch response.result{
            case .success:
                let json : [String:Any] = convertToDictionary(text: response.result.value!)!
                let status = "\(json["status"]!)"
                
                if status == "success"{
                    let dataDict : [String:Any] = json["result"] as! [String : Any]
                    fitnessUserDefaults.sharedInstance.userId = "\(dataDict["user_id"]!)"
                    fitnessUserDefaults.sharedInstance.user_name = "\(dataDict["user_name"]!)"
                    fitnessUserDefaults.sharedInstance.user_Password = "\(dataDict["user_password"]!)"
                    fitnessUserDefaults.sharedInstance.user_email = "\(dataDict["user_email"]!)"
                    fitnessUserDefaults.sharedInstance.retriveUserFromUserDefaults()
                    SVProgressHUD.dismiss()
                    
                    SVProgressHUD.showSuccess(withStatus: "Account created Successfully")
                    fitnessUserDefaults.sharedInstance.KeepLogin = "1"
                    fitnessUserDefaults.sharedInstance.retriveUserFromUserDefaults()
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuController")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    SVProgressHUD.dismiss()
                }
                break
            case .failure:
                SVProgressHUD.dismiss()
                break
            }
        }
    }
}
