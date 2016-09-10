//
//  RBView.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 08.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Cocoa
import Darwin
import CoreData

class RBView: NSView {
    
   
    var mouseLoc: NSPoint = NSPoint()
    var mouseLocDown: NSPoint = NSPoint()
    var mouseClickedByUser: Bool = false
    var mouseDraggedByUser: Bool = false
    
    var manageContext: NSManagedObjectContext? = (NSApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    var pointArrayController: NSArrayController = NSArrayController() ///zmienna, dzięki której można przenieść RBPointArrayController z ViewController do RBView

    
    override func mouseDown(theEvent : NSEvent) {
        mouseLoc = theEvent.locationInWindow
        Swift.print(mouseLoc) //TEST

        RBPoint.create(mouseLoc, context: manageContext!) /// RB: Wrzuca RBPoint do manageContextu
        Swift.print(manageContext!.registeredObjects.count) ///TEST RB: Podczas kliknięcia, pokazuje ilość instancji w manageContext
        self.needsDisplay = true
        
    }
    

    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        /// RB: rysuje tło
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.set()
        NSRectFill(dirtyRect)
        
        let pointColor = NSColor.init(red: 0, green: 0, blue: 0, alpha: 0.3) /// zrobiłem kolor dla punktów półprzeźroczysty aby na wszelki wypadek sprawdzić, czy przypadkiem następująca pętla czegoś nie psuje
        let sizeOfPoints: CGFloat = 10
        
        /// RB: rysujemy wszystkie punkty (potem przeniose zawartość tej pętli do klasy RBPoint
        /// niestety coś się tu, albo w mouseDown chrzani i rysuje punkt nie tam, gdzie trzeba
        /// edit: wiem co się chrzani. mój custom view nie jest zerowym punktem odniesienia dla eventów, także dodałem współczynnik "- 20" do koordyntów xCor oraz yCor, na dniach zobacze jak to można ominąć, by działało po bożemu
        for point:RBPoint in (pointArrayController.arrangedObjects as? [RBPoint])! {
            
            pointColor.set()
            let xCor = CGFloat(point.x!) - sizeOfPoints/2 - 20.0
            let yCor = CGFloat(point.y!) - sizeOfPoints/2 - 20.0
            
            
            let rect = NSRect(origin: NSPoint(x: xCor, y: yCor), size: CGSize(width: sizeOfPoints, height: sizeOfPoints))
            let circle = NSBezierPath(roundedRect: rect, xRadius: sizeOfPoints/2, yRadius: sizeOfPoints/2)
            circle.lineWidth = 2
            //            circle.stroke()
            //            backgroundColor.set()
            circle.fill()


        }
    }
    
}
