//
//  Movie.swift
//  Flix
//
//  Created by Francisco Hernanedez on 10/3/18.
//  Copyright © 2018 Francisco Hernanedz. All rights reserved.
//

import Foundation
import UIKit

class Movie{
    var title: String
    var overview: String
    var posterUrl: URL?
    var backdropUrl: URL?
    var releaseDate: String
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        // Set the rest of the properties
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterPathString = dictionary["poster_path"] as! String
        posterUrl = URL(string: baseURLString + posterPathString)!
        let backdropPathString = dictionary["backdrop_path"] as! String
        backdropUrl = URL(string: baseURLString + backdropPathString)!
        overview = dictionary["overview"] as! String
        releaseDate = dictionary["release_date"] as! String
        
    }
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}

