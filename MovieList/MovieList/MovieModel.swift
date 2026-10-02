//
//  MovieModel.swift
//  MovieList
//
//  Created by Christopher W. Kenny on 9/29/26.
//

import Foundation

struct Movie: Identifiable{
   
    //MARK: Movie Properties
    let id: Int
    let title: String
    let director: String
    let movieRating: String
    let userRating: Double
    let sales: Int
    var hasSeen: Bool = false
}

struct MovieModel{
    var movies:[Movie] = []
    
    static var exampleMovie = Movie(id: 00000, title: "Die Hard", director: "Joe", movieRating: "G", userRating: 4.2, sales: 10000, hasSeen: true)
    //MARK: - methods
    
    init(){
        movies = [
            Movie(id: 633389, title: "Ne Zha 2", director: "Yu Yang", movieRating: "PG-13", userRating: 7.9, sales: 2216990000, hasSeen: false),
            Movie(id: 644146, title: "Zootopia 2", director: "Jared Bush", movieRating:"PG", userRating: 7.3, sales: 1866565725, hasSeen: false),
            Movie(id: 672054, title: "Avatar: Fire and Ash", director: "James Cameron", movieRating: "PG-13", userRating: 7.2, sales: 1485951561, hasSeen: false),
            Movie(id: 549198, title: "Lilo & Stitch", director: "Dean Fleischer Camp",movieRating: "PG", userRating: 6.7, sales: 1037270317, hasSeen: false),
            Movie(id: 589341, title: "A Minecraft Movie", director: "Jared Hess",movieRating: "PG", userRating: 5.6, sales: 957749195, hasSeen: false),
            Movie(id: 625064, title: "Jurassic World: Rebirth", director: "Gareth Edwards", movieRating:"PG-13", userRating: 5.8, sales: 866375125, hasSeen: false),
            Movie(id: 607420, title: "Demon Slayer: Kimetsu No Yaiba Infinity Castle", director: "Hikaru Kondô", movieRating:"R", userRating: 8.4, sales:781314596, hasSeen: true),
            Movie(id: 615539, title: "How to Train Your Dragon", director: "Dean Deblois", movieRating: "PG", userRating: 7.7, sales: 634828273, hasSeen: true),
            Movie(id: 627506, title:"F1: The Movie", director: "Joeseph Kosinski", movieRating: "PG-13", userRating: 7.6, sales: 628827111, hasSeen: false),
            Movie(id: 552960, title: "Superman", director: "James Gunn", movieRating: "PG-13", userRating: 7.0,sales: 615984465, hasSeen: true)
        ]
    }
    mutating func updateMovie(id: Int) {
        if let findMovieIdx = movies.firstIndex(where:
            {$0.id == id}){
            movies[findMovieIdx].hasSeen.toggle()
            print(movies)
        }
    }
}
