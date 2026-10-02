//
//  ContentView.swift
//  MovieList
//
//  Created by Christopher W. Kenny on 9/29/26.
//

import SwiftUI

struct MovieListView: View {
    
    // Declared Property
    @State private var movieVM =
        MovieViewModel()
    
    //MARK: Computed Property
    
    var body: some View{
        NavigationStack{
            List(movieVM.movieModel.movies){
                movie in NavigationLink{
                    MovieDetailView(selectedMovie: movie,
                                    viewModel: $movieVM,
                                    hasSeen: movie.hasSeen
                    )
                } label: {
                    MovieRowView(movie: movie)
                }
                .listRowSeparatorTint(.yellow)
            }
            .navigationTitle("2025 Box Office Hits")
        }
    }
}

#Preview {
    MovieListView()
}

