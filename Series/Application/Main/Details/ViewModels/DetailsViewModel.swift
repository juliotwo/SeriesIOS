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
            completion(DetailsSerieViewModel(serie: self.item!),error,succes)
        }
    }
    
}
class DetailsSerieViewModel {
    private var serie: SerieRequest
    
    var seriesName: String{
        return serie.seriesName
    }
    var banner: String{
        return serie.banner
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
    init(serie:SerieRequest) {
        self.serie = serie
    }
    
    
}
