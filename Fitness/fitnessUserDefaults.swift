//
//  fitnessUserDefaults.swift
//  Fitness
//
//  Created by Love on 16/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation

@objc class fitnessUserDefaults: NSObject
    
{
    static let sharedInstance = fitnessUserDefaults()
    
    private override init() {
        super.init()
        self.retriveUserFromUserDefaults()
    }
    
    
    var _user_image = String()
    
    var user_image: String {
        get {
            return _user_image
        }
        
        set {
            
            if _user_image != newValue {
                _user_image = newValue
                UserDefaults.standard.set(_user_image, forKey: "user_image")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    
    var _user_Password = String()
    
    var user_Password: String {
        get {
            return _user_Password
        }
        
        set {
            
            if _user_Password != newValue {
                _user_Password = newValue
                UserDefaults.standard.set(_user_Password, forKey: "user_Password")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _AppliedForDriver = String()
    
    var AppliedForDriver: String {
        get {
            return _AppliedForDriver
        }
        
        set {
            
            if _AppliedForDriver != newValue {
                _AppliedForDriver = newValue
                UserDefaults.standard.set(_AppliedForDriver, forKey: "AppliedForDriver")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _user_type = String()
    
    var user_type: String {
        get {
            return _user_type
        }
        
        set {
            
            if _user_type != newValue {
                _user_type = newValue
                UserDefaults.standard.set(_user_type, forKey: "user_type")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _user_mobile = String()
    
    var user_mobile: String {
        get {
            return _user_mobile
        }
        
        set {
            
            if _user_mobile != newValue {
                _user_mobile = newValue
                UserDefaults.standard.set(_user_mobile, forKey: "user_mobile")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _user_email = String()
    var user_email: String {
        get {
            return _user_email
        }
        
        set {
            
            if _user_email != newValue {
                _user_email = newValue
                UserDefaults.standard.set(_user_email, forKey: "user_email")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _user_name = String()
    var user_name: String {
        get {
            return _user_name
        }
        
        set {
            
            if _user_name != newValue {
                _user_name = newValue
                UserDefaults.standard.set(_user_name, forKey: "user_name")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _userId = String()
    
    var userId: String {
        get {
            return _userId
        }
        
        set {
            
            if _userId != newValue {
                _userId = newValue
                UserDefaults.standard.set(_userId, forKey: "userId")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    
    var _userBio = String()
    
    var userBio: String {
        get {
            return _userBio
        }
        
        set {
            
            if _userBio != newValue {
                _userBio = newValue
                UserDefaults.standard.set(_userBio, forKey: "userBio")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _gender = String()
    
    var gender: String {
        get {
            return _gender
        }
        
        set {
            
            if _gender != newValue {
                _gender = newValue
                UserDefaults.standard.set(_gender, forKey: "gender")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    var _DOB = String()
    
    var DOB: String {
        get {
            return _DOB
        }
        
        set {
            
            if _DOB != newValue {
                _DOB = newValue
                UserDefaults.standard.set(_DOB, forKey: "DOB")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    
    var _KeepLogin = String()
    
    var KeepLogin: String {
        get {
            return _KeepLogin
        }
        
        set {
            
            if _KeepLogin != newValue {
                _KeepLogin = newValue
                UserDefaults.standard.set(_KeepLogin, forKey: "KeepLogin")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func retriveUserFromUserDefaults() {
        let standardUserDefaults = UserDefaults.standard
        
        _userId = standardUserDefaults.string(forKey: "userId") != nil ? standardUserDefaults.string(forKey: "userId")! : ""
        _KeepLogin = standardUserDefaults.string(forKey: "KeepLogin") != nil ? standardUserDefaults.string(forKey: "KeepLogin")! : ""
        _user_email = standardUserDefaults.string(forKey: "user_email") != nil ? standardUserDefaults.string(forKey: "user_email")! : ""
        _user_name = standardUserDefaults.string(forKey: "user_name") != nil ? standardUserDefaults.string(forKey: "user_name")! : ""
        _user_mobile = standardUserDefaults.string(forKey: "user_mobile") != nil ? standardUserDefaults.string(forKey: "user_mobile")! : ""
        _user_image = standardUserDefaults.string(forKey: "user_image") != nil ? standardUserDefaults.string(forKey: "user_image")! : ""
        _user_type = standardUserDefaults.string(forKey: "user_type") != nil ? standardUserDefaults.string(forKey: "user_type")! : ""
        _gender = standardUserDefaults.string(forKey: "gender") != nil ? standardUserDefaults.string(forKey: "gender")! : ""
        _DOB = standardUserDefaults.string(forKey: "DOB") != nil ? standardUserDefaults.string(forKey: "DOB")! : ""
        _AppliedForDriver = standardUserDefaults.string(forKey: "AppliedForDriver") != nil ? standardUserDefaults.string(forKey: "AppliedForDriver")! : ""
        _user_Password = standardUserDefaults.string(forKey: "user_Password") != nil ? standardUserDefaults.string(forKey: "user_Password")! : ""

        standardUserDefaults.synchronize()
    }
    
}
