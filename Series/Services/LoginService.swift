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
    
    
    public static func obtainToken(completion: @escaping (String?, Error?, Bool?) -> Void){
       
        
        let body = [
            "apikey" : "PPDZ39EGKOEHNR3R",
            "userkey" : "JOEZYXMFGR0RDBXA",
            "username" : "tavromero2yu"
        ]
        var request = URLRequest(url: URL(string: "https://api.thetvdb.com/login")!)
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        Alamofire.request(request).validate().response { response in
            guard let data = response.data else { return }
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                guard let token = json?["token"] as? String else {
                    return
                }
                let sessionManager = Alamofire.SessionManager.default
                let inter = AccessTokenAdapter(token)
                sessionManager.adapter = inter
                sessionManager.retrier = inter
                UserDefaults.standard.set(true, forKey: "session")
                UserDefaults.standard.set(token, forKey: "token")
                completion(token, response.error, true)
            } catch let error {
                print(error)
                completion(nil, error, false)
            }
        }
    }
    
}
