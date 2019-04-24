//
//  excerciseVC2.swift
//  Fitness
//
//  Created by Love on 23/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class excerciseVC2: UIViewController {
   
    var player = AVPlayer()
    var url : URL?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var btn_Play_Pause: UIButton!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var excImage: UIImageView!
    @IBOutlet weak var sets: UILabel!
    @IBOutlet weak var reps: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var equipment: UILabel!
    @IBOutlet weak var musclee: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        func_SetDesign()
        titlee.text = model_getDayWiseData.shared.exercise_title[selected_Day_Exercise]
        excImage.downloadedFrom(link: model_getDayWiseData.shared.exercise_image[selected_Day_Exercise])
        sets.text = model_getDayWiseData.shared.exercise_sets[selected_Day_Exercise]
        reps.text = model_getDayWiseData.shared.exercise_reps[selected_Day_Exercise]
        time.text = model_getDayWiseData.shared.exercise_rest[selected_Day_Exercise]
        equipment.text = model_getDayWiseData.shared.exercise_equipment[selected_Day_Exercise]
        musclee.text = model_getDayWiseData.shared.bodypart_title[selected_Day_Exercise]
        url = URL(string: model_getDayWiseData.shared.exercise_video[selected_Day_Exercise])
        // Do any additional setup after loading the view.
    }

    func func_SetDesign()  {
        func_Button_Round(to: btn_Play_Pause, with: 26)
    }
    
    
   
    @IBAction func btn_in(_ sender:UIButton) {
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

    
    @IBAction func backk(_ sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
}
