//
//  DataManager.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/27.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {
        
    }
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var cafeList = [Cafe]()
    
    
    
    func fetchCafe() {
        let request: NSFetchRequest<Cafe> = Cafe.fetchRequest()
        
        let sortByPrice = NSSortDescriptor(key: "price", ascending: true)
        request.sortDescriptors = [sortByPrice]
        
        do {
            cafeList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    
    func addNewCafe(id: Int16, name: String, price: Int16, latitude: Double, longitude: Double) {
        let newCafe = Cafe()
        newCafe.id = id
        newCafe.name = name
        newCafe.price = price
        newCafe.latitude = latitude
        newCafe.longitude = longitude
        
        saveContext()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WoojumunjiCafe")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
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
