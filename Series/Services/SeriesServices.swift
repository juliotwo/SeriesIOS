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
        //        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let decoder = JSONDecoder()
                let serieRequest = try decoder.decode(ListaSeriesRequest.self, from: data)
               
               completion(serieRequest, response.error, true)
            } catch let error {
                print(error)
               
                completion(nil, response.error, false)
            }
        }
    }
    public static func getDetailsSerie(byId value: Int, completion: @escaping (SerieDetail?, Error?, Bool?) -> Void){
        let val = String(value)
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://api.thetvdb.com/series/\(val)"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            do {
                //let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let decoder = JSONDecoder()
                let serieDetail = try decoder.decode(SerieDetail.self, from: data)
                
                completion(serieDetail, response.error, true)
            } catch let error {
                print(error)
                completion(nil, error, false)
            }
        }
    }
    public static func getMoreDetailsSerie(byId value: String, completion: @escaping (SerieRequest?, Error?, Bool?) -> Void){
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://omdbapi.com/?i=\(value)&apikey=2f1f55d7&plot=full"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            
            do {
               
                let decoder = JSONDecoder()
//                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let serieDetail = try decoder.decode(SerieRequest.self, from: data)
                completion(serieDetail, response.error, true)
            } catch let error {
                print(error)
                completion(nil, error, false)
            }
        }
    }
    
    public static func getActors(byId value: Int, completion: @escaping (ActorsDetails?, Error?, Bool?) -> Void){
        let val = String(value)
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://api.thetvdb.com/series/\(val)/actors"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            do {
//                 let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let decoder = JSONDecoder()
                let actorsDetail = try decoder.decode(ActorsDetails.self, from: data)
                completion(actorsDetail, response.error, true)
            } catch let error {
                print(error)
                completion(nil, error, false)
            }
        }
    }
    public static func getListEpisodes(byId: Int,airedSeason: String, completion: @escaping (ListaEpisodesRequest?, Error?, Bool?) -> Void){
        let id = String(byId)
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let urlString = "https://api.thetvdb.com/series/\(id)/episodes/query?airedSeason=\(airedSeason)"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        ]
        Alamofire.request(urlString, headers:headers).response { response in
            guard let data = response.data else { return }
            do {
                
             //   let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let decoder = JSONDecoder()
                let listEpisodes = try decoder.decode(ListaEpisodesRequest.self, from: data)
                completion(listEpisodes, response.error, true)
            } catch let error {
                print(error)
                completion(nil, error, false)
            }
        }
    }

}
