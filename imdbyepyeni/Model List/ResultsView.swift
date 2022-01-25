//
//  ViewModels.swift
//  imdme
//
//  Created by ABDURRAHMAN AYDIN on 7.01.2022.
//

import Foundation
struct ResultsListViewModel{
    let results : [Results]
    
    func numberOfRowsInSection() -> Int {
        return self.results.count
    }
    func resultsAtIndex(_ index: Int) -> ResultsViewModel  {
        
        let results = self.results[index]
        return ResultsViewModel(results: results)
    }
    
}

struct ResultsViewModel {
    
    let results : Results
    var name : String {
        
        return self.results.name
    }
    var poster_path : String {
        
        return self.results.poster_path
    }
    var vote_average : Double
    
    {
        
        return self.results.vote_average
    }
        
    var id : Int {
        
        return self.results.id
        
    }
    }



struct DetailsModel {
    let details : Details
    var adult : Bool
    {
        
        return self.details.adult ?? false
    }
    
    var overview: String
    
    {
        
        return self.details.overview ?? ""
    }
    var backdrop_path: String
    
    {
        
        return self.details.backdrop_path ?? ""
    }
        
    var homepage: String {
        
        return self.details.homepage ?? ""
        
    }
    var created_by : [Creator]?
    {
        
        return self.details.created_by ?? []
        
    }
}

struct CreatorDetails {
    
    let creators : Creator
    var name: String {
        
        return self.creators.name ?? ""
    }
        
    var profile_path: String {
        
        return self.creators.profile_path ?? String()
        
    }
    var gender : Int
    {
        
        return self.creators.gender ?? Int()
        
    }
    
}
