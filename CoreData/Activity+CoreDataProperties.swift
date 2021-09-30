//
//  Activity+CoreDataProperties.swift
//  
//
//  Created by Gleb Tregubov on 30.09.2021.
//
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func activitiesFetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var activity: String?
    @NSManaged public var paricipantsNumber: Int32
    @NSManaged public var price: Double
    @NSManaged public var type: String?

}
