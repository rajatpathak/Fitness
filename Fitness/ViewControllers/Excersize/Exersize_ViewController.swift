//
//  Exersize_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class Exersize_ViewController: UIViewController {
    //    MARK:- IBOutlets
       @IBOutlet weak var btn_Play_Pause:UIButton!
        @IBOutlet weak var lbl_TitleExcersize:UILabel!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var titleExcercise: UILabel!
    @IBOutlet weak var set: UILabel!
    
    @IBOutlet weak var rest: UILabel!
    @IBOutlet weak var reps: UILabel!
    @IBOutlet weak var equipments: UILabel!
    @IBOutlet weak var musclesInvolved: UILabel!
    @IBOutlet weak var exerciseImage: UIImageView!
    //    MARK:- vars
    var player = AVPlayer()
    var url : URL?
    var level_title = [String]()
    var id = [String]()
    var exercise_video = [String]()
    var exercise_title = [String]()
    var exercise_tips = [String]()
    var exercise_sets = [String]()
    var exercise_rest = [String]()
    var exercise_reps = [String]()
    var exercise_level = [String]()
    var exercise_instructions = [String]()
    var exercise_image = [String]()
    var exercise_id = [String]()
    var exercise_equipment = [String]()
    var equipment_title = [String]()
    var bodypart_title = [String]()
    
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func_SetDesign()
        lbl_TitleExcersize.text = Model_Day.shared.str_Title
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        for i in 0..<model_equipments.shareed.exercise_equipment.count{
            var check = String()
            if senderOfWorkouts == "1"{
               check = model_equipments.shareed.exercise_id[i]
            }
            else if senderOfWorkouts == "2"{
                check = model_equipments.shareed.exercise_equipment[i]
            }
            else{
            }
            if senderIdEquipments == check{
                exercise_video.append("\(model_equipments.shareed.exercise_video[i])")
                exercise_title.append("\(model_equipments.shareed.exercise_title[i])")
                exercise_sets.append("\(model_equipments.shareed.exercise_sets[i])")
                exercise_rest.append("\(model_equipments.shareed.exercise_rest[i])")
                exercise_reps.append("\(model_equipments.shareed.exercise_reps[i])")
                exercise_level.append("\(model_equipments.shareed.exercise_level[i])")
                exercise_image.append("\(model_equipments.shareed.exercise_image[i])")
                exercise_equipment.append("\(model_equipments.shareed.exercise_equipment[i])")
                equipment_title.append("\(model_equipments.shareed.equipment_title[i])")
                bodypart_title.append("\(model_equipments.shareed.bodypart_title[i])")
            }
        }
        titleExcercise.text = exercise_title[model_equipments.shareed.selectedExercide]
        set.text = exercise_sets[model_equipments.shareed.selectedExercide]
        rest.text = exercise_rest[model_equipments.shareed.selectedExercide]
        reps.text = exercise_reps[model_equipments.shareed.selectedExercide]
        equipments.text = exercise_equipment[model_equipments.shareed.selectedExercide]
        musclesInvolved.text = bodypart_title[model_equipments.shareed.selectedExercide]
        url = URL(string: exercise_video[model_equipments.shareed.selectedExercide])!
        exerciseImage.downloadedFrom(link: IMAGE_BASE_URL+exercise_image[model_equipments.shareed.selectedExercide])
        
       
        
    }
    
    
    //    MARK:- IBActions
    @IBAction func btn_Login(_ sender:UIButton) {
        sender.isSelected = !(sender.isSelected)
        play()
    }
    func play()
    {
        
        let videoURL = url!
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        
        
    }

    @IBAction func back(_ sender: Any) {
        model_equipments.shareed.selectedExercide = Int()
        self.dismiss(animated: true, completion: nil)
    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}
