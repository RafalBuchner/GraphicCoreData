//
//  RBDrawing.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 10.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Foundation
import Cocoa

struct RBDrawing {
    static var PointWidth: CGFloat = LineWidth + LineWidth / 3
    static var LineWidth: CGFloat = 2
    
    func zeroAxis(zeroXY: NSPoint) {
        let length: CGFloat = 5
        NSColor.redColor().set() ////////ustaw w settings
        let leftPoint   = NSPoint(x: zeroXY.x - length, y: zeroXY.y         )
        let rightPoint  = NSPoint(x: zeroXY.x + length, y: zeroXY.y         )
        let topPoint    = NSPoint(x: zeroXY.x,          y: zeroXY.y + length)
        let bottomPoint = NSPoint(x: zeroXY.x,          y: zeroXY.y - length)
        let xLine = NSBezierPath()
        xLine.moveToPoint(leftPoint)
        xLine.lineToPoint(rightPoint)
        xLine.stroke()
        let yLine = NSBezierPath()
        yLine.moveToPoint(topPoint)
        yLine.lineToPoint(bottomPoint)
        yLine.stroke()
    }
    
    func background(dirtyRect: NSRect) {
        RBColor.BackgroundColor.set()
        NSRectFill(dirtyRect)
    }
}