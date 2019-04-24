//
//  Home_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

import SideMenuSwift

class Home_ViewController: UIViewController ,SideMenuControllerDelegate {
    //    MARK:- IBOutlets

    //    MARK:- vars
    let arr_HomeTitle = ["","Workouts","Exercises","Diets","Blog"]
    let arr_HomeIcons = ["","workouts","excersizes","Diets","blog"]

    let arr_HomeContent = ["","Routines & Training Programs","Exercise Video Guides","Personlized Diet Plans","Informative Posts & News"]

    var view_SideMenu:UIView!
    
    //    MARK:- VC's life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuController?.delegate = self
        SideMenuController.preferences.basic.menuWidth = 250
        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
        SideMenuController.preferences.basic.position = .above
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.supportedOrientations = .all
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true

//        self.navigationController?.navigationBar.barTintColor = UIColor .func_AppRedColor()
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "Menu_ViewController")
        view_SideMenu = menuVC?.view
        self.view.addSubview(view_SideMenu)
        view_SideMenu.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- IBActions
    @IBAction func btn_SideMenu(_ sender: UIButton) {
        self.sideMenuController?.revealMenu()

    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
