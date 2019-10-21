//
//  CoreDataManager.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 21/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager {
    public static let shared = CoreDataManager()
    
    let identifier: String = ""
    let model: String = "GymTrainer"
    
    lazy var persistentContainer: NSPersistentContainer = {
//        let messageKitBundle = Bundle(identifier: self.identifier)
//        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
//        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
//
//        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        let container = NSPersistentContainer(name: self.model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
