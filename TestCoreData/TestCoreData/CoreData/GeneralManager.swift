//
//  GeneralManager.swift
//  TestCoreData
//
//  Created by ArthurWang on 15/10/29.
//  Copyright © 2015年 ArthurWang. All rights reserved.
//

import Foundation
import CoreData


class GeneralManager: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

}




class GeneralManagerToGeneralManagerPolicy: NSEntityMigrationPolicy {
    
    override func createRelationshipsForDestinationInstance(dInstance: NSManagedObject, entityMapping mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        if dInstance.entity.name == "GeneralManager" {
            let generalManagerEntity = dInstance as! GeneralManager
            
            let departmentArr = Department.MR_findAll()
            
            generalManagerEntity.department?.setByAddingObjectsFromArray(departmentArr)
        }
    }
    
    
}
