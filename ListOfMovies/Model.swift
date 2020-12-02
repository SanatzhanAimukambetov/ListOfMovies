//
//  Model.swift
//  ListOfMovies
//
//  Created by Sanatzhan Aimukambetov on 03.12.2020.
//

import Foundation

struct MoviesData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let title: String?
    let overview: String?
    let posterImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case posterImage = "poster_path"
    }
}
