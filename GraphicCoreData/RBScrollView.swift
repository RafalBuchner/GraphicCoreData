//
//  RBScrollView.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 11.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Cocoa


class RBScrollView: NSScrollView {
    
    var mouseLoc: NSPoint = NSPoint()
//    var mouseLocDown: NSPoint = NSPoint()
//    var mouseClickedByUser: Bool = false
//    var mouseDraggedByUser: Bool = false
    override func mouseDown(theEvent : NSEvent) {
        mouseLoc = theEvent.locationInWindow
        Swift.print(mouseLoc) //TEST
        self.needsDisplay = true
        
    }
   
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
}

