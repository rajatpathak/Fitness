//
//  Konstant.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    class func func_AppRedColor() -> UIColor {
        return UIColor (red: 255.0/255.0, green: 66.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
    class func func_textFieldBorder() -> UIColor {
        return UIColor (red: 219.0/255.0, green: 222.0/255.0, blue: 226.0/255.0, alpha: 1.0)
    }
    
    class func func_YellowColor() -> UIColor {
        return UIColor (red: 252.0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
}


extension UIViewController {
    
    func func_AddPaddingAndBorder_TextField(to textfield: UITextField) {
        textfield.layer.cornerRadius =  23
        textfield.layer.borderColor = UIColor.func_textFieldBorder().cgColor
        textfield.layer.borderWidth = 1
        textfield.clipsToBounds = true
        
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 30, height: textfield.frame.size.height))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
    }

    func func_Button_Border(to button: UIButton) {
        
        button.layer.borderColor = UIColor .func_AppRedColor().cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
    }
    
    func func_Button_Round(to button: UIButton, with radius:Int) {
        button.layer.cornerRadius = CGFloat(radius)
        button.clipsToBounds = true
    }

}

func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}
