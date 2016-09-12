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

    var manageContext: NSManagedObjectContext? = (NSApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    override func mouseDown(theEvent : NSEvent) {
        
        mouseLoc = theEvent.locationInWindow
        var mouseLocInRBViewBounds = NSPoint()
        
        //Rysowanie poza defaultowym widokiem :
        // jak przenieść tą sumę do RBPoint.create ? Przez outlety mi nie wychodzi
        let editViewOrigin = subviews[0].subviews[0].visibleRect.origin
        mouseLocInRBViewBounds.x = mouseLoc.x + editViewOrigin.x
        mouseLocInRBViewBounds.y = mouseLoc.y + editViewOrigin.y
        
        RBPoint.create(mouseLocInRBViewBounds, context: manageContext!) /// RB: Wrzuca
        Swift.print(mouseLocInRBViewBounds) //TEST
        self.needsDisplay = true
        Swift.print("editView origin: \(subviews[0].subviews[0].visibleRect.origin)")
    }
   
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
}

