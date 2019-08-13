//
//  SeriesServices.swift
//  Series
//
//  Created by julio vargas bautista on 8/6/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import Alamofire
typealias SeriesHandler = ( (_ success: Bool, _ error: Error?) -> Void)
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
                print(completion)
                print(serieRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    
    public static func getSearchSeries(byId value: String, completion: @escaping (ListaSeriesRequest?, Error?, Bool?) -> Void){

        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://api.thetvdb.com/search/series?name=\(value.replacingOccurrences(of:" ", with: "%20"))"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let serieRequest = try decoder.decode(ListaSeriesRequest.self, from: data)
               
               completion(serieRequest, response.error, true)
                print(serieRequest)
            } catch let error {
                print(error)
               
                completion(nil, error, false)
            }
        }
    }
    public static func getDetailsSerie(byId value: Int, completion: @escaping (SerieDetail?, Error?, Bool?) -> Void){
        let val = String(value)
        print(val)
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://api.thetvdb.com/series/\(val)"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let serieDetail = try decoder.decode(SerieDetail.self, from: data)
                
                completion(serieDetail, response.error, true)
                print(serieDetail)
            } catch let error {
                print(error)
                
                completion(nil, error, false)
            }
        }
    }
//    https://{{omdb_endpoint}}/?i=tt0944947&apikey={{omdb_apikey}}&plot=full
    
    public static func getPosterSerie(byId value: String, completion: @escaping (SerieDetail?, Error?, Bool?) -> Void){
        
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://{{omdb_endpoint}}/?i=\(value)&apikey={{omdb_apikey}}&plot=full"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let serieDetail = try decoder.decode(SerieDetail.self, from: data)
                
                completion(serieDetail, response.error, true)
                print(serieDetail)
            } catch let error {
                print(error)
                
                completion(nil, error, false)
            }
        }
    }

}
