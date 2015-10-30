//
//  GeneralManager+CoreDataProperties.swift
//  TestCoreData
//
//  Created by ArthurWang on 15/10/30.
//  Copyright © 2015年 ArthurWang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension GeneralManager {

    @NSManaged var name: String?
    @NSManaged var board: Board?
    @NSManaged var manager: NSSet?
    @NSManaged var department: NSSet?

}
