//
//  AddReviewViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/2/21.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    
    var title: String = ""
    var text: String = ""
    
    func addReviewForMovie(movieParam: MovieViewModel) {
        let movie = CoreDataManager.shared.getMovieById(id: movieParam.id)
        let review = Review(context: CoreDataManager.shared.viewContext)
        
        review.title = title
        review.text = text
        review.movie = movie
        
        CoreDataManager.shared.save()
    }
    
}
