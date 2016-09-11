//
//  RBPointArrayController.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 08.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Cocoa
import CoreData

class RBPointArrayController: NSArrayController {
    
    
    func draw() {
        
        for point:RBPoint in (self.arrangedObjects as? [RBPoint])! {

            point.draw()
            
        }
        
    }
    
    
}
