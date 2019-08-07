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
   static func getSeriesRequest(byId name: String, completion: @escaping (ListaSeriesRequest?) -> Void) {
                
    guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://api.thetvdb.com/search/series?name="+name
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token 
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
