//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData
class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    // Will create and use as a single instance - Singleton interface
    static let shared = CoreDataManager()
    private init() {
        persistentContainer = NSPersistentContainer(name: "MovieAppModel")
        persistentContainer.loadPersistentStores(completionHandler: {(description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        })
    }
    
    func getMovieById(id: NSManagedObjectID) -> Movie? {
        do {
            return try persistentContainer.viewContext.existingObject(with: id) as? Movie
        } catch {
            print(error)
            return nil
        }
    }
    
    func deleteMovie(_ movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Deleting the movie failed \(error)")
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save the movie \(error)")
        }
    }
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
   
}
