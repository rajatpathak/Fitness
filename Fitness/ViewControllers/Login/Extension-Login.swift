//
//  Extension-Login.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SVProgressHUD
import FBSDKLoginKit

extension Login_ViewController {
    
    func func_SetDesign()  {
        
        func_AddPaddingAndBorder_TextField(to: txt_Email)
        func_AddPaddingAndBorder_TextField(to: txt_Password)
        
        func_Button_Border(to: btn_Login)
        func_Button_Border(to: btn_Login_Fb)
        func_Button_Border(to: btn_Login_Google)

        img_Logo.layer.cornerRadius = 4
        img_Logo.clipsToBounds = true
    }
    
    //FB
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    let resultJson : NSDictionary = result as! NSDictionary
                    let socialID = "\(resultJson["id"]!)"
                    SVProgressHUD.show()
                    let url = API_LOGIN_URL
                    let parameter : [String:Any] = ["_token":"\(API_SECURE_TOKEN)","email":"","password":"","social_id":"\(socialID)","fcm_token:":"","device_type":"\(DEVIE_TYPE)"] as [String:Any]
                    
                    Alamofire.request(url, method: .post, parameters: parameter).validate().responseString { (response) in
                        switch response.result{
                        case .success:
                            
                            let responseCode = response.response?.statusCode
                            print("\(String(describing: responseCode))")
                            if let dictonary = response.value{
                                let JsonDict = convertToDictionary(text: dictonary)
                                if JsonDict!["status"] as! String == "success"{
                                    print(JsonDict!)
                                    let dataDict : [String:Any] = JsonDict!["result"] as! [String:Any]
                                    fitnessUserDefaults.sharedInstance.userId = "\(dataDict["user_id"]!)"
                                    fitnessUserDefaults.sharedInstance.user_name = "\(dataDict["user_name"]!)"
                                    fitnessUserDefaults.sharedInstance.user_Password = "\(dataDict["user_password"]!)"
                                    fitnessUserDefaults.sharedInstance.user_email = "\(dataDict["user_email"]!)"
                                    fitnessUserDefaults.sharedInstance.KeepLogin = "1"
                                     fitnessUserDefaults.sharedInstance.retriveUserFromUserDefaults()
                                    SVProgressHUD.dismiss()
                                    
                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuController")
                                    self.present(vc!, animated: true, completion: nil)
                                }
                                else if JsonDict!["status"] as! String == "failed"{
                                    print("not a user")
                                    SVProgressHUD.dismiss()
                                    let message : String = JsonDict!["message"] as! String
                                    SVProgressHUD.showError(withStatus: "\(message)")
                                    
                                }
                                
                            }
                            
                            break
                            
                        case .failure(let error):
                            print(error)
                            print("error in loggin in")
                            SVProgressHUD.dismiss()
                            break
                        }
                    }
                }
            })
        }
    }
    
    
    func login(){
        SVProgressHUD.show()
        let url = API_LOGIN_URL
        let parameter : [String:Any] = ["_token":"\(API_SECURE_TOKEN)","email":"\(self.txt_Email.text!)","password":"\(self.txt_Password.text!)","social_id":"","fcm_token:":"","device_type":"\(DEVIE_TYPE)"] as [String:Any]
        
        Alamofire.request(url, method: .post, parameters: parameter).validate().responseString { (response) in
            switch response.result{
            case .success:
                
                let responseCode = response.response?.statusCode
                print("\(String(describing: responseCode))")
                if let dictonary = response.value{
                    print(dictonary)
                    let JsonDict = convertToDictionary(text: dictonary)
                    print(JsonDict!)
                    if JsonDict!["status"] as! String == "success"{
                        print(JsonDict!)
                        let dataDict : [String:Any] = JsonDict!["result"] as! [String:Any]
                        fitnessUserDefaults.sharedInstance.userId = "\(dataDict["user_id"]!)"
                        fitnessUserDefaults.sharedInstance.user_name = "\(dataDict["user_name"]!)"
                        fitnessUserDefaults.sharedInstance.user_Password = "\(dataDict["user_password"]!)"
                        fitnessUserDefaults.sharedInstance.user_email = "\(dataDict["user_email"]!)"
                        fitnessUserDefaults.sharedInstance.KeepLogin = "1"
                         fitnessUserDefaults.sharedInstance.retriveUserFromUserDefaults()
                        SVProgressHUD.dismiss()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuController")
                        self.present(vc!, animated: true, completion: nil)
                    }
                    else if JsonDict!["status"] as! String == "failed"{
                        print("not a user")
                        SVProgressHUD.dismiss()
                        let message : String = JsonDict!["message"] as! String
                        SVProgressHUD.showError(withStatus: "\(message)")
                        
                    }
                    
                }
                
                break
                
            case .failure(let error):
                print(error)
                print("error in loggin in")
                SVProgressHUD.dismiss()
                break
            }
        }
    }
    
    
    func forgotPassword(){
        SVProgressHUD.show()
        let url = API_FORGOT_PASSWORD
        let parameter : [String:Any] = ["_token":"\(API_SECURE_TOKEN)","email":"\(self.txt_Email.text!)"] as [String:Any]
        
        Alamofire.request(url, method: .post, parameters: parameter).validate().responseString { (response) in
            switch response.result{
            case .success:
                
                let responseCode = response.response?.statusCode
                print("\(String(describing: responseCode))")
                if let dictonary = response.value{
                    let JsonDict = convertToDictionary(text: dictonary)
                    if JsonDict!["status"] as! String == "success"{
                        SVProgressHUD.showSuccess(withStatus: "password sent to your email")
                        UIView.animate(withDuration: 1.5) {
                            self.viewMain.alpha = 1.0
                            self.viewMain.isUserInteractionEnabled = true
                            self.forgotPasswordViewHeight.constant = 0.0
                            self.forgotPasswordView.alpha = 0.0
                            self.view.setNeedsLayout()
                            self.view.layoutIfNeeded()
                        }
                    }
                    else if JsonDict!["status"] as! String == "failed"{
                        print("not a user")
                        SVProgressHUD.dismiss()
                    }
                    
                }
                
                break
                
            case .failure(let error):
                print(error)
                print("error in loggin in")
                SVProgressHUD.dismiss()
                break
            }
        }
    }
}
