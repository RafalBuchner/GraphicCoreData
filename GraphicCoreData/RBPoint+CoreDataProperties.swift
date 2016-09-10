//
//  RBPoint+CoreDataProperties.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 08.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension RBPoint {

    @NSManaged var x: NSNumber?
    @NSManaged var y: NSNumber?
    @NSManaged var selected: NSNumber?

}
