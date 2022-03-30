//
//  Reviews+Extensions.swift
//  MovieApp
//
//  Created by Don McKenzie on 29-Mar-22.
//

import Foundation
import CoreData

extension Review: BaseModel {
    static func getReviewsByMovieId (moviedId: NSManagedObjectID) -> [Review] {
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "movie = %@", moviedId)
        
        do {
            return try CoreDataManager.shared.viewContext.fetch(request)
        } catch {
            return []
        }
    }
}

