//
//  LoginViewModel.swift
//  Series
//
//  Created by SalvadorKano on 8/1/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

typealias LoginHandler = ( (_ success: Bool, _ error: Error?) -> Void)

class LoginViewModel {
    static func AccessToken(handler: LoginHandler?) {
        
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
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    if let parseJson = json {
                        let accessToken = parseJson["token"] as? String
                        
                        let defaults = UserDefaults.standard
                        
                        defaults.set(accessToken, forKey: "token")
                        print(accessToken!)
                    }
                    
                    
                }catch {
                    print("El procedimiento del JSON tuvo un error")
                }
            }
            
        }
        
        tarea.resume()
    }
}
