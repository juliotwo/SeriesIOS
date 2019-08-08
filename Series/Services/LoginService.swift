//
//  LoginService.swift
//  Series
//
//  Created by julio vargas bautista on 8/6/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import Alamofire

typealias LoginHandler = ( (_ success: Bool, _ error: Error?) -> Void)

class LoginService {
    
    
    
    public static func obtenerToken(viewContoller: UIViewController, handler: LoginHandler?){
        
    let body = [
        "apikey" : "PPDZ39EGKOEHNR3R",
        "userkey" : "JOEZYXMFGR0RDBXA",
        "username" : "tavromero2yu"
    ]
    var request = URLRequest(url: URL(string: "https://api.thetvdb.com/login")!)
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    
    let tarea = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        if error != nil {
            print(error!)
            handler?(false, nil)
        } else {
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                if let parseJson = json {
                    let accessToken = parseJson["token"] as? String
                    
                    let defaults = UserDefaults.standard
                    
                    defaults.set(accessToken, forKey: "token")
                    defaults.set(true, forKey: "session")
                    print(accessToken!)
                    handler?(true, nil)
                }
                
                
            }catch {
                print("El procedimiento del JSON tuvo un error")
            }
        }
        
    }
    tarea.resume()
    }
}
