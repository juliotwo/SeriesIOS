//
//  DetailsViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/13/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

protocol DetailsViewModelModelDelegate {
    func reloadData()
}
class DetailsViewModel {
    
    
    private var item : SerieRequest?
    
    var delegate: SearchViewModelDelegate?
    
    init() {
        
        //        getdata()
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(getdate), name: Notification.Name("AddedNewData"), object: nil)
    }
    
    
    
    public func  getDetailsSerie(id:Int, completion: @escaping (DetailsSerieViewModel?, Error?, Bool?) -> Void){
        
        SeriesServices.getDetailsSerie(byId: id) { (serie, error, succes) in
            guard let serie = serie else {
                return
            }
            self.item = serie.data
            if (!(serie.data.imdbId!.isEmpty)){
                print(serie.data.imdbId ?? "hola")
                SeriesServices.getMoreDetailsSerie(byId: serie.data.imdbId!) { (serie, error, succes) in
                    guard let serie = serie else {
                        return
                    }
                    let data = serie
                    self.item?.Poster = data.Poster
                    self.item?.totalSeasons = data.totalSeasons
                    completion(DetailsSerieViewModel(serie: self.item!),error,succes)
                }
            }
            else{
                completion(DetailsSerieViewModel(serie: self.item!),error,succes)
            }
            
        }
    }
//    public func  getMoreDetailsSerie(imbId:String, completion: @escaping (String?,String?, Error?, Bool?) -> Void){
//
//        SeriesServices.getMoreDetailsSerie(byId: imbId) { (serie, error, succes) in
//            guard let serie = serie else {
//                return
//            }
//            let data = serie.data
//            completion(data.Poster,data.airsTime,error,succes)
//        }
//    }
    
}
class DetailsSerieViewModel {
    private var serie: SerieRequest
    
    var seriesName: String{
        return serie.seriesName ?? ""
    }
    var banner: String{
        return serie.banner ?? ""
    }
    var firstAired: String{
        return serie.firstAired ?? ""
    }
    var genre: String{
        return serie.genre?.joined(separator: ",") ?? ""
    }
    var airsTime:String{
        return serie.airsTime ?? ""
    }
    var overview:String{
        return serie.overview ?? ""
    }
    var rarting:Float{
        return serie.siteRating ?? 0
    }
    var poster: String{
        return serie.Poster ?? ""
    }
    var sessions: String{
        return serie.totalSeasons ?? ""
    }
    init(serie:SerieRequest) {
        self.serie = serie
    }
    
    
}
