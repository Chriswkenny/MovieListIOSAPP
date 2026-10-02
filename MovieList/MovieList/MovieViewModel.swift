//
//  MovieViewModel.swift
//  MovieList
//
//  Created by Christopher W. Kenny on 9/29/26.
//

import SwiftUI

@Observable
class MovieViewModel {
    
    var movieModel = MovieModel()
    
    //Function updates if movie has been seen or not
    func updateMovie(id: Int){
        movieModel.updateMovie(id: id)
    }
}
