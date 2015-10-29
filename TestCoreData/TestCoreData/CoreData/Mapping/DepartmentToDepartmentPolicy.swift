//
//  DepartmentToDepartmentPolicy.swift
//  TestCoreData
//
//  Created by ArthurWang on 15/10/29.
//  Copyright © 2015年 ArthurWang. All rights reserved.
//

import UIKit
import CoreData

class DepartmentToDepartmentPolicy: NSEntityMigrationPolicy {

    override func createDestinationInstancesForSourceInstance(sInstance: NSManagedObject, entityMapping mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        
        let userInfo:NSDictionary = mapping.userInfo!
        let modelVersion = userInfo.valueForKey("modelVersion")
        
        if 4 == modelVersion?.integerValue {
            let newObject = NSEntityDescription.insertNewObjectForEntityForName(mapping.destinationEntityName!, inManagedObjectContext: manager.destinationContext)
            
            let oldNumber = sInstance.valueForKey("number")
            let oldNumberStr = oldNumber?.string
            
            newObject.setValue(oldNumberStr, forKey: "number")
            
            manager.associateSourceInstance(sInstance, withDestinationInstance: newObject, forEntityMapping: mapping)
        } else {
            try
                super.createDestinationInstancesForSourceInstance(sInstance, entityMapping: mapping, manager: manager)
        }
    }
}
