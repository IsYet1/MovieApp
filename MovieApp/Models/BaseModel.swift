//
//  BaseModel.swift
//  MovieApp
//
//  Created by Don McKenzie on 29-Mar-22.
//

import Foundation
import CoreData

protocol BaseModel: NSManagedObject {
    func save()
    func delete()
    static func byId<T: NSManagedObject>(id: NSManagedObjectID) -> T?
    static func all<T: NSManagedObject>() -> [T]
}

extension BaseModel {
    func save() {
        CoreDataManager.shared.save()
    }
    
    func delete() {
        CoreDataManager.shared.viewContext.delete(self)
        save()
    }
    
    static func all<T>() -> [T] where T: NSManagedObject {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
        do {
            return try CoreDataManager.shared.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    // An id (NSManagedObjectID) is sent in for the Type T where T is of type NSManagedObject
    static func byId<T>(id: NSManagedObjectID) -> T? where T: NSManagedObject {
        do {
            return try CoreDataManager.shared.viewContext.existingObject(with: id) as? T
        } catch {
            print(error)
            return nil
        }
    }
    
}

