//
//  Extension-Bodyparts.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit

extension Bodyparts_ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "cell_Bodyparts", for: indexPath) as! cell_Bodyparts
        cell.image.contentMode = .scaleAspectFill
        cell.image.downloadedFrom(link: self.Image[indexPath.row])
        cell.title.text = self.name[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "afterEquipmentVC") as! afterEquipmentVC
        senderIdEquipments = BodyPartID[indexPath.row]
        self.present(vc, animated: true, completion: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
}
extension Bodyparts_ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = UIScreen.main.bounds
        return CGSize(width: screen.width/2, height: screen.height/3.55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
