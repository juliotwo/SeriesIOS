//
//  SeriesServices.swift
//  Series
//
//  Created by julio vargas bautista on 8/6/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import Alamofire

class SeriesServices: NSObject {
    func getSeriesRequest(byId name: String, completion: @escaping (ListaSeriesRequest?) -> Void) {
        
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
                        print(accessToken)
                        defaults.set(accessToken, forKey: "token")
                    }
                    
                    
                }catch {
                    print("El procedimiento del JSON tuvo un error")
                }
            }
            
        }
        tarea.resume()
        let token = UserDefaults.standard.string(forKey: "token")
        let urlString = "https://api.thetvdb.com/search/series?name=Game"
        let headers: HTTPHeaders = [
           
            "Content-Type": "application/json"
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let serieRequest = try decoder.decode(ListaSeriesRequest.self, from: data)
                completion(serieRequest)
                print(serieRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }

}
