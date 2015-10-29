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
            description +=  self.name!
            description += "\n"
            description += "number is "
            description +=  (nil != self.number) ? (self.number?.stringValue)!.stringByRemovingPercentEncoding! : ""
            description += "\n\n\n"
        
        return description
    }

}
