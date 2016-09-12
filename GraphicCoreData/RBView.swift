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
    var zeroXY:(width:Float, height:Float) = (0, 0)
    var pointArrayController: RBPointArrayController = RBPointArrayController() ///zmienna, dzięki której można przenieść RBPointArrayController z ViewController do RBView
    
    override func awakeFromNib() {
        Swift.print(">>> RBView: awaken")
        Swift.print(">>> Superview: \(superview!.superview!.className)")
    }
    
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        /// RB: rysuje tło + punkt zerowy osi
        let viewBackground = RBDrawing()
        viewBackground.background(dirtyRect)
        viewBackground.zeroAxis(zeroXY)
        
        /// RB: rysujemy wszystkie punkty z poziomu klasy RBPointArrayController
        pointArrayController.draw()
        
//        Swift.print("\(self.visibleRect)")

    }
    
}
