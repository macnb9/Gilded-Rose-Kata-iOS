//
//  AppDelegate.swift
//  GildedRoseKata
//
//  Created by Blake Macnair on 2/20/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared = UIApplication.shared.delegate as! AppDelegate
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.NSManagedObjectContextDidSave, object: nil, queue: nil) { notification in
            guard let context = notification.object as? NSManagedObjectContext else { return }
            
            /*if context.name != nil {
                if context.name == "background" {
                    self.persistentContainer.viewContext.mergeChanges(fromContextDidSave: notification)
                }
            } else*/ if context != self.persistentContainer.viewContext {
                self.persistentContainer.viewContext.mergeChanges(fromContextDidSave: notification)
            }
        }
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Gilded_Rose_Kata")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext(_ context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAll() {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.persistentStoreCoordinator?.execute(deleteRequest, with: context)
        } catch let error {
            print(error)
        }
    }
}

