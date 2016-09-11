//
//  RBScrollView.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 11.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Cocoa

/**
    w tej klasie będą wrzucane wszelkie informacje do coreDaty biorące się z eventów. Np tworzenie punktów.
    Będzie to klasa, z której zostają dane wysyłane do coreDaty. W klasie RBView dane coreDaty będą pobierane, w celu ich wyrysowania, z poziomu ArrayControllerów.
 **/

class RBScrollView: NSScrollView {
    
    lazy var mouseLoc: NSPoint = NSPoint()
//    var mouseLocDown: NSPoint = NSPoint()
//    var mouseClickedByUser: Bool = false
//    var mouseDraggedByUser: Bool = false
    var manageContext: NSManagedObjectContext? = (NSApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    override func mouseDown(theEvent : NSEvent) {
        mouseLoc = theEvent.locationInWindow
        RBPoint.create(mouseLoc, context: manageContext!) /// RB: Wrzuca
        Swift.print(mouseLoc) //TEST
        self.needsDisplay = true
        
    }
   
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
}

