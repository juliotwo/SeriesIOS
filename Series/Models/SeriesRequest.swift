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

struct ActorsDetails: Codable {
    let data: [ActorsRequest]
    
    enum CodigKeyh: String, CodingKey{
        case data = "data"
    }
}

struct SerieRequest: Codable {
    
    let id: Int?
    let banner: String?
    let seriesName: String?
    let firstAired: String?
    let genre: [String]?
    let imdbId: String?
    let airsTime: String?
    let siteRating: Float?
    let overview: String?
    var Poster:String?
    var totalSeasons: String?
    
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
        case Poster = "Poster"
        case totalSeasons = "totalSeasons"
    }
}


struct ActorsRequest: Codable {
    var name: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image = "image"
    }
}
struct ListaEpisodesRequest: Codable {
    let data: [EpisodesRequest]
    
    enum CodigKeyh: String, CodingKey{
        case data = "data"
    }
}
struct EpisodesRequest: Codable {
    var airedEpisodeNumber: Int?
    var overview: String?
    var filename: String?
    var episodeName: String?
    
    enum CodingKeys: String, CodingKey {
        case airedEpisodeNumber = "airedEpisodeNumber"
        case overview = "overview"
        case filename = "filename"
        case episodeName = "episodeName"
    }
}
