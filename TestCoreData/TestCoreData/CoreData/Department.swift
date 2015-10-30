//
//  Department.swift
//  TestCoreData
//
//  Created by ArthurWang on 15/10/22.
//  Copyright © 2015年 ArthurWang. All rights reserved.
//

import Foundation
import CoreData

class Department: NSManagedObject{

// Insert code here to add functionality to your managed object subclass
    
    func descriptionSimple() -> String {
        var description = "name is "
            description +=  (nil != self.name) ? self.name! : ""
            description += "\n"
            description += "number is "
            description +=  (nil != self.number) ? self.number! : ""
            description += "\n\n\n"
        
        return description
    }

}


// MARK: -  Policy

class DepartmentToDepartmentPolicy: NSEntityMigrationPolicy {
    
    override func createDestinationInstancesForSourceInstance(sInstance: NSManagedObject, entityMapping mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        
        let userInfo:NSDictionary = mapping.userInfo!
        let modelVersion = userInfo.valueForKey("modelVersion")
        
        if 4 == modelVersion?.integerValue {
            let newObject = NSEntityDescription.insertNewObjectForEntityForName(mapping.destinationEntityName!, inManagedObjectContext: manager.destinationContext)
            
            
            let oldNumber = sInstance.valueForKey("number")
            let oldNumberStr = String(oldNumber!)
            let name = sInstance.valueForKey("name")!
            
            newObject.setValue(oldNumberStr, forKey: "number")
            newObject.setValue(name, forKey: "name")
            
            manager.associateSourceInstance(sInstance, withDestinationInstance: newObject, forEntityMapping: mapping)
        } else {
            try
                super.createDestinationInstancesForSourceInstance(sInstance, entityMapping: mapping, manager: manager)
        }
    }
    
}

