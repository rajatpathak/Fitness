//
//  equipments.swift
//  Fitness
//
//  Created by Love on 18/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD

var senderTitleEquipments = String()
var senderIdEquipments = String()

class equipments: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
    
    var name = [String]()
    var Image = [String]()
    var equipID = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.show()
        getDataOfTble()

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Equipment_TableViewCell") as! Equipment_TableViewCell
        cell.name.text = name[indexPath.row]
        cell.img.downloadedFrom(link: Image[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if name.count > 0{
            senderTitleEquipments = name[indexPath.row]
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "afterEquipmentVC") as! afterEquipmentVC
        senderIdEquipments = equipID[indexPath.row]
        self.present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getDataOfTble(){
        name.removeAll()
        Image.removeAll()
        
        api_func.api_alamofire_get(url: API_BASE_URL+API_EQUIPMENTS) { (response) in
            let resp : [String:Any] = convertToDictionary(text: response)!
             SVProgressHUD.dismiss()
                let result : NSArray = resp["equipments"] as! NSArray
                for i in 0..<result.count{
                    let dict : NSDictionary = result[i] as! NSDictionary
                    self.name.append("\(dict["equipment_title"]!)")
                    self.Image.append(IMAGE_BASE_URL+"\(dict["equipment_image"]!)")
                    self.equipID.append("\(dict["equipment_id"]!)")
                }
                self.tableview.reloadData()
            }
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
