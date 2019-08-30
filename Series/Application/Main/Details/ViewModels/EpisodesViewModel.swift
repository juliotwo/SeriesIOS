//
//  EpisodesViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/19/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
protocol EpisodeshViewModelDelegate {
    func reloadData()
}
class EpisodesViewModel{
    private var items: [EpisodesRequest] = []

    var numberOfitems: Int {
        return items.count
    }
    
    var delegate: EpisodeshViewModelDelegate?
    
    init(id:Int) {
        getdata(id: id, airedSeason: "1") { (lista, error, succes) in
            //print("Succes")
        }
    }
     public func getdata(id:Int, airedSeason: String, completion: @escaping (ListaEpisodesRequest?, Error?, Bool?) -> Void)
    {
        
        SeriesServices.getListEpisodes(byId: id, airedSeason: airedSeason){ (lista,error,succes)  in
            guard let lista = lista else {
                return
            }
            self.items = lista.data
            self.delegate?.reloadData()
            completion(lista,error,succes)
        }
        
        
    }
    func item(at indexPath: IndexPath) -> EpisodeSerieViewModel {
        return EpisodeSerieViewModel(episode: items[indexPath.row])
    }
}
class EpisodeSerieViewModel {
    private var episode: EpisodesRequest
    
    var numberEpisode: Int{
        return episode.airedEpisodeNumber ?? 0
    }
    var image: String{
        return episode.filename ?? ""
    }
    var oveview: String{
        return episode.overview ?? ""
    }
    var episodeName: String {
        return episode.episodeName ?? ""
    }
    init(episode:EpisodesRequest) {
        self.episode = episode
    }
    
    
}
