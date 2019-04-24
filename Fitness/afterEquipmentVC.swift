//
//  afterEquipmentVC.swift
//  Fitness
//
//  Created by Love on 18/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD

class afterEquipmentVC: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var Tile = [String]()
    var subTitle = [String]()
    var image = [String]()
    
//    senderIdEquipments
    override func viewDidLoad() {
        super.viewDidLoad()
        navbar.topItem?.title = senderTitleEquipments
        tableView.delegate = self
        tableView.dataSource = self
        if senderOfWorkouts == "1"{
           get_DeetailsOFBodyParts()
        }
        else if senderOfWorkouts == "2"{
            getDetailsOfEqipments()
        }
        else{
        }

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tile.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentDetailTableViewCell") as! EquipmentDetailTableViewCell
        cell.EqipmentImgae.downloadedFrom(link: image[indexPath.row])
        cell.title.text = Tile[indexPath.row]
        cell.subTitle.text = subTitle[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        model_equipments.shareed.selectedExercide = Int()
        model_equipments.shareed.selectedExercide = indexPath.row
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Exersize_ViewController") as! Exersize_ViewController
        self.present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
//    senderIdEquipments
    
    func get_DeetailsOFBodyParts(){
        SVProgressHUD.show()
        
        Tile = [String]()
        subTitle = [String]()
        image = [String]()
        
        model_equipments.shareed.level_title = [String]()
        model_equipments.shareed.id = [String]()
        model_equipments.shareed.exercise_video = [String]()
        model_equipments.shareed.exercise_title = [String]()
        model_equipments.shareed.exercise_tips = [String]()
        model_equipments.shareed.exercise_sets = [String]()
        model_equipments.shareed.exercise_rest = [String]()
        model_equipments.shareed.exercise_reps = [String]()
        model_equipments.shareed.exercise_level = [String]()
        model_equipments.shareed.exercise_instructions = [String]()
        model_equipments.shareed.exercise_image = [String]()
        model_equipments.shareed.exercise_id = [String]()
        model_equipments.shareed.exercise_equipment = [String]()
        model_equipments.shareed.equipment_title = [String]()
        model_equipments.shareed.bodypart_title = [String]()
        
        api_func.api_alamofire_get(url: API_BASE_URL+GET_BODY_PARTS_DETAIL) { (response) in
            let jsonResponse : [String:Any] = convertToDictionary(text: response)!
            let dataArray : NSArray = jsonResponse["exercises_bodyparts"] as! NSArray
            for i in 0..<dataArray.count{
                let dict : NSDictionary = dataArray[i] as! NSDictionary
                model_equipments.shareed.level_title.append("\(dict["level_title"]!)")
                model_equipments.shareed.id.append("\(dict["id"]!)")
                model_equipments.shareed.exercise_video.append("\(dict["exercise_video"]!)")
                model_equipments.shareed.exercise_title.append("\(dict["exercise_title"]!)")
                model_equipments.shareed.exercise_tips.append("\(dict["exercise_tips"]!)")
                model_equipments.shareed.exercise_sets.append("\(dict["exercise_sets"]!)")
                model_equipments.shareed.exercise_rest.append("\(dict["exercise_rest"]!)")
                model_equipments.shareed.exercise_reps.append("\(dict["exercise_reps"]!)")
                model_equipments.shareed.exercise_level.append("\(dict["exercise_level"]!)")
                model_equipments.shareed.exercise_instructions.append("\(dict["exercise_instructions"]!)")
                model_equipments.shareed.exercise_image.append("\(dict["exercise_image"]!)")
                model_equipments.shareed.exercise_id.append("\(dict["exercises_bodyparts_bodypart_id"]!)")
                model_equipments.shareed.exercise_equipment.append("\(dict["exercise_equipment"]!)")
                model_equipments.shareed.equipment_title.append("\(dict["equipment_title"]!)")
                model_equipments.shareed.bodypart_title.append("\(dict["bodypart_title"]!)")
            }
            for i in 0..<model_equipments.shareed.exercise_equipment.count{
                if senderIdEquipments == model_equipments.shareed.exercise_id[i]{
                    self.Tile.append("\(model_equipments.shareed.exercise_title[i])")
                    self.subTitle.append("\(model_equipments.shareed.level_title[i])")
                    self.image.append(IMAGE_BASE_URL+"\(model_equipments.shareed.exercise_image[i])")
                }
            }
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
    
    
    func getDetailsOfEqipments(){
        SVProgressHUD.show()

        model_equipments.shareed.level_title = [String]()
        model_equipments.shareed.id = [String]()
        model_equipments.shareed.exercise_video = [String]()
        model_equipments.shareed.exercise_title = [String]()
        model_equipments.shareed.exercise_tips = [String]()
        model_equipments.shareed.exercise_sets = [String]()
        model_equipments.shareed.exercise_rest = [String]()
        model_equipments.shareed.exercise_reps = [String]()
        model_equipments.shareed.exercise_level = [String]()
        model_equipments.shareed.exercise_instructions = [String]()
        model_equipments.shareed.exercise_image = [String]()
        model_equipments.shareed.exercise_id = [String]()
        model_equipments.shareed.exercise_equipment = [String]()
        model_equipments.shareed.equipment_title = [String]()
        model_equipments.shareed.bodypart_title = [String]()
        
        api_func.api_alamofire_get(url: API_BASE_URL+GET_EQUIPMENT_DETAIL) { (response) in
            let jsonResponse : [String:Any] = convertToDictionary(text: response)!
            let dataArray : NSArray = jsonResponse["exercises"] as! NSArray
            for i in 0..<dataArray.count{
                let dict : NSDictionary = dataArray[i] as! NSDictionary
                model_equipments.shareed.level_title.append("\(dict["level_title"]!)")
                model_equipments.shareed.id.append("\(dict["id"]!)")
                model_equipments.shareed.exercise_video.append("\(dict["exercise_video"]!)")
                model_equipments.shareed.exercise_title.append("\(dict["exercise_title"]!)")
                model_equipments.shareed.exercise_tips.append("\(dict["exercise_tips"]!)")
                model_equipments.shareed.exercise_sets.append("\(dict["exercise_sets"]!)")
                model_equipments.shareed.exercise_rest.append("\(dict["exercise_rest"]!)")
                model_equipments.shareed.exercise_reps.append("\(dict["exercise_reps"]!)")
                model_equipments.shareed.exercise_level.append("\(dict["exercise_level"]!)")
                model_equipments.shareed.exercise_instructions.append("\(dict["exercise_instructions"]!)")
                model_equipments.shareed.exercise_image.append("\(dict["exercise_image"]!)")
                model_equipments.shareed.exercise_id.append("\(dict["exercise_id"]!)")
                model_equipments.shareed.exercise_equipment.append("\(dict["exercise_equipment"]!)")
                model_equipments.shareed.equipment_title.append("\(dict["equipment_title"]!)")
                model_equipments.shareed.bodypart_title.append("\(dict["bodypart_title"]!)")
            }
            for i in 0..<model_equipments.shareed.exercise_equipment.count{
                if senderIdEquipments == model_equipments.shareed.exercise_equipment[i]{
                    self.Tile.append("\(model_equipments.shareed.exercise_title[i])")
                    self.subTitle.append("\(model_equipments.shareed.level_title[i])")
                    self.image.append(IMAGE_BASE_URL+"\(model_equipments.shareed.exercise_image[i])")
                }
            }
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   

}
