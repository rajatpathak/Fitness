//
//  Bodyparts_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import SVProgressHUD
class Bodyparts_ViewController: UIViewController {
    //    MARK:- IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    //    MARK:- vars
    var name = [String]()
    var Image = [String]()
    var BodyPartID = [String]()
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.show()
        getBodyPart()
        
    }
    

    @IBAction func backk(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //    MARK:- IBActions
    
    //    MARK:- Custom functions
    
    func getBodyPart(){
        
        name.removeAll()
        Image.removeAll()
        BodyPartID.removeAll()
        
        api_func.api_alamofire_get(url: API_BASE_URL+GET_BODY_PARTS) { (response) in
            let jsonResponse = convertToDictionary(text: response)!
            let result : NSArray = jsonResponse["bodyparts"] as! NSArray
            for i in 0..<result.count{
                let dict : NSDictionary = result[i] as! NSDictionary
                self.BodyPartID.append("\(dict["bodypart_id"]!)")
                self.Image.append(IMAGE_BASE_URL+"\(dict["bodypart_image"]!)")
                self.name.append("\(dict["bodypart_title"]!)")
            }
            self.collectionView.reloadData()
            SVProgressHUD.dismiss()
        }
        
    }
    
    
    //    MARK:- Finish
}
