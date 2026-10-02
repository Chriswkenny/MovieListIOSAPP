//
//  MovieRowView.swift
//  MovieList
//
//  Created by Christopher W. Kenny on 9/29/26.
//
import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    let baseURL = "https://theposterdb.com/api/assets/"
    
    var body: some View {
        HStack (alignment: .top){
            let imageURL = URL(string:
            baseURL + String(movie.id))
            
            AsyncImage(url: imageURL){
                phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
            }   else{
                    ProgressView()
                        .frame(width:100, height: 100)
                }
            }
        VStack(alignment:.leading){
                Text("\(movie.title)").font(.system(size:20))
                Text(String(movie.director))
                Text("Rated: \(movie.movieRating)")
            Text("User Rating: " + String(format: "%.1f", movie.userRating))
            Text("Sales: $" + String(movie.sales)).font(Font.caption.bold())
                if movie.hasSeen{
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
}
#Preview {
    let exampleMovie =
        MovieModel.exampleMovie
    MovieRowView(movie: exampleMovie)
}
