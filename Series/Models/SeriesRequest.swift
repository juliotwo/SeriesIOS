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

struct SerieDetail: Codable {
    let data: SerieRequest
    
    enum CodigKeyh: String, CodingKey{
        case data = "data"
    }
}
struct SerieRequest: Codable {
    
    let id: Int
    let banner: String
    let seriesName: String
    let firstAired: String?
    let genre: [String]?
    let imdbId: String?
    let airsTime: String?
    let siteRating: Float?
    let overview: String?
    
    enum CodingKeys: String, CodingKey{
        case banner = "banner"
        case seriesName = "seriesName"
        case id = "id"
        case firstAired = "firstAired"
        case genre = "genre"
        case imdbId = "imdbId"
        case airsTime = "airsTime"
        case siteRating = "siteRating"
        case overview = "overview"
    }
}
//{
//    "data": {
//        "id": 121361,
//        "seriesName": "Game of Thrones",
//        "aliases": [],
//        "banner": "graphical/121361-g22.jpg",
//        "seriesId": "",
//        "status": "Ended",
//        "firstAired": "2011-04-17",
//        "network": "HBO",
//        "networkId": "",
//        "runtime": "55",
//        "genre": [
//        "Adventure",
//        "Drama",
//        "Fantasy"
//        ],
