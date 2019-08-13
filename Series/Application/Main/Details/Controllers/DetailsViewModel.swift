//
//  DetailsViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/10/19.
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

 
    
    @objc public func getDetailsSerie(id:Int){
        
        SeriesServices.getDetailsSerie(byId: id) { (serie, error, succes) in
            guard let serie = serie else {
                return
            }
            self.item = serie.data
            
        }
        
        
    }
}
