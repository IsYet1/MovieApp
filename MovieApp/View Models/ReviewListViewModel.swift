//
//  ReviewListViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/2/21.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewsByMovie(movieParm: MovieViewModel) {
        // Since reviews is @Published, wrap in a DispatchQueue
        DispatchQueue.main.async {
            self.reviews = Review.getReviewsByMovieId(moviedId: movieParm.id).map(ReviewViewModel.init)
        }
    }
    
}

struct ReviewViewModel {
    let review: Review
    
    var reviewId: NSManagedObjectID {
        return review.objectID
    }
    
    var title: String {
        return review.title ?? ""
    }
    
    var text: String {
        return review.text ?? ""
    }
    
    var publishedDate: Date? {
        return review.publishedAt
    }
    
}
