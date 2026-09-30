//
//  MovieDetailView.swift
//  MovieList
//
//  Created by Christopher W. Kenny on 9/29/26.
//

import SwiftUI

struct MovieDetailView: View {
    
    //Data sent from callig view
    let selectedMovie: Movie
    
    //@Binding refers to viewModel instantiated in parent view
    @Binding var viewModel: MovieViewModel
    
    //Local variable to track ToggleView: If user has seen the movie
    @State var hasSeen: Bool
    
    let baseURL = "https://theposterdb.com/posters/"
    
    var body: some View {
        VStack{
            ZStack{
                let movieID = selectedMovie.id
                let imageURL = URL(string: baseURL + String(movieID))
                AsyncImage(url: imageURL){
                    phase in
                    if let image =
                        phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }else{
                        ProgressView()
                    }
                }
                
                VStack{
                    HStack{
                        Spacer()
                        if
                            selectedMovie.hasSeen{
                            Image(systemName: "star.fill")
                                .font(.system(size:60))
                                .foregroundStyle(.white,.yellow).padding(10)
                        }
                    }
                    Spacer()
                    
                    Text(selectedMovie.title + " " + selectedMovie.director)
                        .padding(2)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.yellow)
                }
            }
            .frame(width: 300, height: 300)
            Text(selectedMovie.movieRating)
            
            // toggle on/off switch, invoking viewModel with the intent to update if the movie has been seen or not
            Toggle("Have Seen Movie", isOn: $hasSeen)
                .onChange(of: hasSeen){
                    viewModel
                        .updateMovie(id: selectedMovie.id)
                }
            
            
        }
    }
}
