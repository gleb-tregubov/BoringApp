//
//  CoreDataManager.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 25.09.2021.
//

import UIKit
import CoreData

struct CoreDataManager {

    static func isActivityExist(currentActivity: SavedActivityModel, onContext context: NSManagedObjectContext) -> Bool {
        let fetchRequest = NSFetchRequest<Activity>(entityName: "Activity")
        fetchRequest.predicate = NSPredicate(format: "activity = %@", currentActivity.activity)
//        let fetchRequest = Activity.activitiesFetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "activity LIKE %@", currentActivity.activity)
        
        var reuslts = [NSManagedObject]()
        
        do {
            reuslts = try context.fetch(fetchRequest)
        } catch let error {
            print("error executing fetch request: \(error)")
        }
        
        return reuslts.count > 0
        
    }
    
    static func fetchActivities(onContext context: NSManagedObjectContext) -> [Activity] {
        
        let fetchRequest = Activity.activitiesFetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch let error {
            print("[!!!] Context Save Error, Actitivy doesnt saved")
            print("Error: \(error)")
        }
        
        return [Activity]()
        
    }
    
    static func saveActitvity(currentActivity: SavedActivityModel, onContext context: NSManagedObjectContext) -> Activity {
        
        let activity = Activity(context: context)
        
        context.performAndWait {
            activity.activity = currentActivity.activity
            activity.type = currentActivity.type
            activity.paricipantsNumber = Int32(currentActivity.participants)
            activity.price = currentActivity.price
        }
        
        do {
            try context.save()
        } catch let error {
            print("[!!!] Context Save Error, Actitivy doesnt saved")
            print("Error: \(error)")
        }
        
        return activity
        
    }
    
}
