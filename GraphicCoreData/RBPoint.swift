//
//  RBPoint.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 08.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Foundation
import CoreData
import Cocoa

class RBPoint: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    class func create(point: NSPoint, context: NSManagedObjectContext) -> RBPoint {
        
        let newPoint = NSEntityDescription.insertNewObjectForEntityForName("RBPoint", inManagedObjectContext: context) as! RBPoint
//        print(context.registeredObjects.count) //-TEST
        newPoint.x = point.x
        newPoint.y = point.y
        return newPoint
    }

    
    override func prepareForDeletion() {
         print("Entity \(self.objectID) has been deleted")
    }
}
