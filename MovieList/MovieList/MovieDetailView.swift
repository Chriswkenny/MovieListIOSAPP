//
//  MovieDetailView.swift
//  MovieList
//
//  Created by Christopher W. Kenny on 9/29/26.
//

import SwiftUI

struct MovieDetailView: View {
    
    //Data sent from calling view
    let selectedMovie: Movie
    
    
    //@Binding refers to viewModel instantiated in parent view
    @Binding var viewModel: MovieViewModel
    
    //Local variable to track ToggleView: If user has seen the movie
    @State var hasSeen: Bool
    
    let baseURL = "https://theposterdb.com/api/assets/"
    
    var body: some View {
        VStack{
            Spacer()
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
                                .foregroundStyle(.yellow,.yellow).padding()
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: 300, height: 300)
            Spacer() //Added to Prevent title from overlapping Poster
            Text(selectedMovie.title)
                .bold()
                .padding(2)
                .font(.title)
                .foregroundColor(.white)
                .background(Color.yellow)
            Text("Director: " + selectedMovie.director).bold()
            Text("Movie Rating: " + selectedMovie.movieRating).bold()
            Text("Movie Sales: $" + String(selectedMovie.sales)).bold()
            
            // toggle on/off switch, invoking viewModel with the intent to update if the movie has been seen or not
            Toggle("Have Seen Movie: ", isOn: $hasSeen)
                .onChange(of: hasSeen){
                    viewModel
                        .updateMovie(id: selectedMovie.id)
                }
            Spacer()
            
        }
        .navigationTitle(selectedMovie.title)
        .padding()
    }
}
#Preview {
    @Previewable @State var movieVM =
    MovieViewModel()
    
    let selectedMovie =
    MovieModel.exampleMovie
    MovieDetailView(selectedMovie: selectedMovie, viewModel: $movieVM, hasSeen: selectedMovie.hasSeen)
}
