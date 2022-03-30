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
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
   
}
