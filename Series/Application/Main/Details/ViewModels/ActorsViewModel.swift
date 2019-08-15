//
//  ActorsViewModel.swift
//  Series
//
//  Created by SalvadorKano on 8/14/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

protocol ActorsViewModelDelegate {
    func reloadData()
}
class ActorsViewModel{
    
    private var items: [ActorsRequest] = []
    
    var numberOfitems: Int {
        return items.count
    }
    
    var delegate: ActorsViewModelDelegate?
    
    init(id: Int) {
        getData(id: id)
    }
    
    @objc public func getData(id: Int){
        SeriesServices.getActors(byId: id) { (lista, error, succes) in
            guard let lista = lista else {
                return
            }
            self.items = lista.data
            self.delegate?.reloadData()
        }
    }

    
    
    func item(at indexPath: IndexPath) -> DetailsActorViewModel {
        return DetailsActorViewModel(actors: items[indexPath.item])
    }

}

class DetailsActorViewModel {
    private var actors: ActorsRequest
    
    var name: String{
        return actors.name ?? ""
    }
    
    var image: String{
        return actors.image ?? ""
    }
    init(actors:ActorsRequest) {
        self.actors = actors
    }
}
