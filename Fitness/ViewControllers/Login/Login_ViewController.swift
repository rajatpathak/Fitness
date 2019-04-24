//
//  Login_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import SVProgressHUD
import Alamofire

class Login_ViewController: UIViewController , GIDSignInUIDelegate , GIDSignInDelegate {
    //    MARK:- IBOutlets
    @IBOutlet weak var txt_Email:UITextField!
    @IBOutlet weak var txt_Password:UITextField!
    
    @IBOutlet weak var forgotPasswordViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var btn_Login:UIButton!
    @IBOutlet weak var btn_Login_Fb:UIButton!
    @IBOutlet weak var btn_Login_Google:UIButton!

    @IBOutlet weak var emailForgot: UITextField!
    @IBOutlet weak var img_Logo:UIImageView!
    @IBOutlet weak var forgotPasswordView: UIView!
    
    //    MARK:- vars
    
    
    
    //    MARK:- VC's life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        self.viewMain.alpha = 1.0
        self.viewMain.isUserInteractionEnabled = true
        self.forgotPasswordViewHeight.constant = 0.0
        self.forgotPasswordView.alpha = 0.0
        func_SetDesign()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.barTintColor = UIColor .func_AppRedColor()
    }
    

    
    //    MARK:- IBActions
    @IBAction func btn_Login(_ sender: Any) {
        let isEmailValid = isValidEmail(testStr: txt_Email.text!)
        if txt_Email.text! == ""{
            SVProgressHUD.showError(withStatus: "email is empty")
        }
        else if isEmailValid == false{
            SVProgressHUD.showError(withStatus: "email is not in correct format")
        }
        else if txt_Password.text == ""{
            SVProgressHUD.showError(withStatus: "password cannot be empty")
        }
        else{
            self.login()
        }
    }
    
    @IBAction func googleLogin(_ sender: UIButton) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate=self
        GIDSignIn.sharedInstance().signIn()
    }
    
    //MARK:- Google Delegate
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func fbLogin(_ sender: UIButton) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
            fbLoginManager.logOut()

        }
    }
    
    @IBAction func cancelForgotPassword(_ sender: UIButton) {
        UIView.animate(withDuration: 1.5) {
            self.viewMain.alpha = 1.0
            self.viewMain.isUserInteractionEnabled = true
            self.forgotPasswordViewHeight.constant = 0.0
            self.forgotPasswordView.alpha = 0.0
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func resetPassword(_ sender: UIButton){
        let isEmailValid = isValidEmail(testStr: emailForgot.text!)
        
        if emailForgot.text! == ""{
            SVProgressHUD.showError(withStatus: "email is empty")
        }
        else if isEmailValid == false{
            SVProgressHUD.showError(withStatus: "email is not in correct format")
        }
        else{
            forgotPassword()
        }
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        UIView.animate(withDuration: 1.5) {
            self.viewMain.alpha = 0.2
            self.viewMain.isUserInteractionEnabled = false
            self.forgotPasswordViewHeight.constant = 220.0
            self.forgotPasswordView.alpha = 1.0
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
        
        
    }
    @IBAction func btn_Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //    MARK:- Custom functions
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                     withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            SVProgressHUD.show()
            let url = API_LOGIN_URL
            let parameter : [String:Any] = ["_token":"\(API_SECURE_TOKEN)","email":"","password":"","social_id":"\(userId!)","fcm_token:":"","device_type":"\(DEVIE_TYPE)"] as [String:Any]
            
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
            GIDSignIn.sharedInstance().signOut()
        }
    }
    
    
    
    
    //    MARK:- Finish
}
