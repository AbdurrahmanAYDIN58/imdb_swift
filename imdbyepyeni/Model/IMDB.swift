//
//  IMDB.swift
//  imdbyepyeni
//
//  Created by ABDURRAHMAN AYDIN on 21.01.2022.
//

import Foundation
struct IMDB :Decodable {
    let page : Int
    let results : [Results]
  
    
}
struct Results :Decodable {
    let name : String
    let poster_path :String
    let vote_average :Double
    let id :Int
    
    init(poster_path : String, vote_average : Double, name : String, id : Int)
    {
        self.poster_path = poster_path
        self.vote_average = vote_average
        self.name = name
        self.id = id
    }
}

struct Details:Decodable {
    let backdrop_path: String?
    let homepage: String?
    let created_by : [Creator]?
    let overview : String?
    let name: String?
    let adult: Bool?
    init(backdrop_path : String, homepage : String, created_by : [Creator], overview : String, name: String,adult: Bool)
    {   self.adult = adult
        self.backdrop_path = backdrop_path
        self.homepage = homepage
        self.created_by = created_by
        self.overview = overview
        self.name = name
    }
    
}
struct Creator: Decodable{
    
    let name : String?
    let profile_path: String?
    let gender: Int?
    init(name : String,profile_path: String,gender: Int){
        self.name = name
        self.gender = gender
        self.profile_path = profile_path
    }
    
}

