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
    
    // nie wie, czy to nie powinno być w jakims ObjectController. Ale tu jest bardziej czytelne niż we View
    
    func draw() {
        NSColor.init(red: 0, green: 0, blue: 0, alpha: 0.3).set() /// zrobiłem kolor dla punktów półprzeźroczysty aby na wszelki wypadek sprawdzić, czy przypadkiem następująca pętla czegoś nie psuje
        let sizeOfPoints: CGFloat = 10
        

        
        let xCor = CGFloat(self.x!) - sizeOfPoints/2 - 20.0
        let yCor = CGFloat(self.y!) - sizeOfPoints/2 - 20.0
        
        
        let rect = NSRect(origin: NSPoint(x: xCor, y: yCor), size: CGSize(width: sizeOfPoints, height: sizeOfPoints))
        let circle = NSBezierPath(roundedRect: rect, xRadius: sizeOfPoints/2, yRadius: sizeOfPoints/2)
        circle.lineWidth = 2
        //            circle.stroke()
        //            backgroundColor.set()
        circle.fill()
    }
}
