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
    let sizeOfPoints: CGFloat = 10
    var editViewOrigin: NSPoint = NSPoint()

// Insert code here to add functionality to your managed object subclass
    class func create(point: NSPoint, context: NSManagedObjectContext) -> RBPoint {
        
        let newPoint = NSEntityDescription.insertNewObjectForEntityForName("RBPoint", inManagedObjectContext: context) as! RBPoint
//        print(context.registeredObjects.count) //-TEST
        newPoint.x = point.x
        newPoint.y = point.y
        return newPoint
    }

    func draw(color: NSColor = RBColor.PointColor) {
        
        // Draws Point on screen
        /// niestety coś się tu chrzani i rysuje punkt nie tam, gdzie trzeba
        /// edit: wiem co się chrzani. mój custom view nie jest zerowym punktem odniesienia dla eventów, także dodałem współczynnik "- 20" do koordyntów xCor oraz yCor, na dniach zobacze jak to można ominąć, by działało po bożemu
        
        // ??? Co zrobić aby editViewOrigin przejmował informacje z RBView.visibleRect.origin
        color.set()
        Swift.print("editViewOrigin: \(editViewOrigin)")
        Swift.print(" RBPoint.xx:\(CGFloat(self.x!) - sizeOfPoints/2 + editViewOrigin.x - 20.0)")
        let xCor = CGFloat(self.x!) - sizeOfPoints/2 + editViewOrigin.x - 20.0
        let yCor = CGFloat(self.y!) - sizeOfPoints/2 + editViewOrigin.y - 20.0
        
        let rect = NSRect(origin: NSPoint(x: xCor, y: yCor), size: CGSize(width: sizeOfPoints, height: sizeOfPoints))
        let circle = NSBezierPath(roundedRect: rect, xRadius: sizeOfPoints/2, yRadius: sizeOfPoints/2)
        
        circle.lineWidth = RBDrawing.PointWidth
        circle.stroke()

    }
    override func prepareForDeletion() {
         print("Entity \(self.objectID) has been deleted")
    }
}
