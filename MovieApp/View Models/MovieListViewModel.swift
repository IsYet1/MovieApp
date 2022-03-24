//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Don McKenzie on 24-Mar-22.
//

import Foundation
import CoreData

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieViewModel]()
    
    func deleteMovie(movie: MovieViewModel) {
        let movie = CoreDataManager.shared.getMovieById(id: movie.id)
        if let movie = movie {
            CoreDataManager.shared.deleteMovie(movie)
        }
    }
    
    func getAllMovies() {
        let localMovies = CoreDataManager.shared.getAllMovies()
        DispatchQueue.main.async {
            self.movies = localMovies.map(MovieViewModel.init)
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    
    var id: NSManagedObjectID {
        return movie.objectID
    }
    var title: String { return movie.title ?? "" }
    var director: String { return movie.director ?? "No Director Set" }
    var releaseDate: String? { return movie.releaseDate?.asFormattedString() }
    var rating: Int? { return Int(movie.rating) }
}
