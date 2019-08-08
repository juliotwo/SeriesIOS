//
//  SearchViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/7/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

protocol SearchViewModelDelegate {
    func reloadData()
}
class SearchViewModel {
    private var items: [SerieRequest] = []
    
 
    
    var numberOfitems: Int {
        return items.count
    }
    
    var delegate: SearchViewModelDelegate?
    
    init() {
        getdata()
        NotificationCenter.default.addObserver(self, selector: #selector(getdata), name: Notification.Name("AddedNewData"), object: nil)
    }
    @objc public func getdata(){

        SeriesServices.getSeriesRequest(byId: "Game") { (lista) in
            guard let lista = lista else {
                return
            }
            self.items = lista.data
             self.delegate?.reloadData()
        }
        
        
    }
    @objc public func getdataByName(name:String){
        
        SeriesServices.getSearchSeries(byId: name) { (lista, error, succes) in
            guard let lista = lista else {
                return
            }
            self.items = lista.data
            self.delegate?.reloadData()
        }

        
    }
    func item(at indexPath: IndexPath) -> SearchSerieViewModel {
        return SearchSerieViewModel(serie: items[indexPath.row])
    }
    
}
class SearchSerieViewModel {
    private var serie: SerieRequest
    
    var seriesName: String{
        return serie.seriesName
    }
    var banner: String{
        return serie.banner
    }
    init(serie:SerieRequest) {
        self.serie = serie
    }
    
    
}
