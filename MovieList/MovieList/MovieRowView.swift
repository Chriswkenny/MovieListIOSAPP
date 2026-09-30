//
//  MovieRowView.swift
//  MovieList
//
//  Created by Christopher W. Kenny on 9/29/26.
//
import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    let baseURL = "https://www.imdb.com/list/ls597681409/"
    
    var body: some View {
        //FIX THIS, IT WONT GENERATE PHOTO ASSIGNED
        HStack (alignment: .top){
            let imageURL = URL(string:
            baseURL + String(movie.title))
            
            AsyncImage(url: imageURL){
                phase in
                if let image = phase.image {
                    image
                }
            }
        }
    }
}
