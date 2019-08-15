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
        print(items.count)
        return items.count
    }
    
    var delegate: ActorsViewModelDelegate?
    
    init() {
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
//    public func  getActors(id:Int, completion: @escaping (DetailsActorViewModel?, Error?, Bool?) -> Void){
//
//        SeriesServices.getActors(byId: id) { (actors, error, succes) in
//            guard let actors = actors else {
//                return
//            }
//            print(actors)
//        }
//    }
    
    
    func item(at indexPath: IndexPath) -> DetailsActorViewModel {
        return DetailsActorViewModel(actors: items[indexPath.row])
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
