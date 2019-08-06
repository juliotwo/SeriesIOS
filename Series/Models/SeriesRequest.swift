//
//  SeriesRequest.swift
//  Series
//
//  Created by julio vargas bautista on 8/6/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

struct ListaSeriesRequest:Codable{
    let data: [SerieRequest]
    
    enum CodigKeyh: String, CodingKey{
        case data = "data"
    }
}
struct SerieRequest: Codable {
    
    let banner: String
    let seriesName: String
    let id: Int
    
    enum CodingKeys: String, CodingKey{
        case banner = "banner"
        case seriesName = "seriesName"
        case id = "id"
    }
}
