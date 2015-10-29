//
//  Department+CoreDataProperties.swift
//  TestCoreData
//
//  Created by ArthurWang on 15/10/29.
//  Copyright © 2015年 ArthurWang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Department {

    @NSManaged var name: String?
    @NSManaged var number: String?
    @NSManaged var manager: Manager?

}

class DepartmentToDepartmentPolicy: NSEntityMigrationPolicy {
    
    override func createDestinationInstancesForSourceInstance(sInstance: NSManagedObject, entityMapping mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        
        let userInfo:NSDictionary = mapping.userInfo!
        let modelVersion = userInfo.valueForKey("modelVersion")
        
        if 4 == modelVersion?.integerValue {
            let newObject = NSEntityDescription.insertNewObjectForEntityForName(mapping.destinationEntityName!, inManagedObjectContext: manager.destinationContext)
            
            let oldNumber = sInstance.valueForKey("number")
            let oldNumberStr = String(oldNumber!)
            
            newObject.setValue(oldNumberStr, forKey: "number")
            
            manager.associateSourceInstance(sInstance, withDestinationInstance: newObject, forEntityMapping: mapping)
        }
        
        try
            super.createDestinationInstancesForSourceInstance(sInstance, entityMapping: mapping, manager: manager)
    }
}
