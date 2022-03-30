//
//  AddMovieViewModel.swift
//  MovieApp
//
//  Created by Don McKenzie on 23-Mar-22.
//

import Foundation

class AddMovieViewModel: ObservableObject {
    var title: String = ""
    var director: String = ""
    @Published var rating: Int? = nil
    var releaseDate: Date = Date() // Current date
    
    func save() {
        let movie = Movie(context: Movie.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseDate
        
        movie.save()
    }
}
