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
        RBColor.BackgroundColor.set()
        NSRectFill(dirtyRect)
        
        
        /// RB: rysujemy wszystkie punkty (potem przeniose zawartość tej pętli do klasy RBPoint
        /// niestety coś się tu, albo w mouseDown chrzani i rysuje punkt nie tam, gdzie trzeba
        /// edit: wiem co się chrzani. mój custom view nie jest zerowym punktem odniesienia dla eventów, także dodałem współczynnik "- 20" do koordyntów xCor oraz yCor, na dniach zobacze jak to można ominąć, by działało po bożemu
        for point:RBPoint in (pointArrayController.arrangedObjects as? [RBPoint])! {
            
            point.draw()


        }
    }
    
}
