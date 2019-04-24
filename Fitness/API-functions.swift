
//
//  API-functions.swift
//  Fitness
//
//  Created by Love on 19/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import Alamofire

class api_func {
    


   class func api_alamofire_post(url: String,parameeters: [String:Any],completion:@escaping (String)->()){
        Alamofire.request(url, method: .post, parameters: parameeters as [String:Any]).validate().responseString { (response) in
            switch response.result {
            case .success:
                let response_string = response.result.value
                let jsonResponse = convertToDictionary(text: response_string!)
                if response_string == "" || response_string == nil{
                    completion("false")
                }
                else{
                    if jsonResponse!["result"] as! String == "success"{
                        completion(response_string!)

                    }
                    else{
                        completion("false")

                    }

                }
                break
            case .failure:
                completion("false")

                break
            }
        }
    }
    
    class func api_alamofire_get(url: String,completion:@escaping (String)->()){
        let headers: HTTPHeaders = [
        "Content-type": "application/json"]
        
        Alamofire.request(url, method: .get, parameters: nil, headers: headers).validate().responseString { (response) in
            switch response.result {
            case .success:
                let response_string = response.result.value
                let jsonResponse = convertToDictionary(text: response_string!)
                completion(response_string!)

                break
            case .failure:
                completion("false")
                
                break
            }
        }
    }
    
    

}
