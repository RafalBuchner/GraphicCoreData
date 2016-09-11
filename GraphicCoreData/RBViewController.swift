//
//  ViewController.swift
//  GraphicCoreData
//
//  Created by Rafal Buchner on 08.09.2016.
//  Copyright © 2016 Rafal Buchner. All rights reserved.
//

import Cocoa
import Darwin
import CoreData

class RBViewController: NSViewController {
    
    @IBOutlet weak var editView: RBView!
    @IBOutlet var pointArrayController: NSArrayController!
    var manageContext: NSManagedObjectContext? = (NSApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editView.pointArrayController = pointArrayController as! RBPointArrayController
        print("Program started with following number of entities in CoreData: \(manageContext!.registeredObjects.count)") //TEST
    }
    override func viewWillDisappear() {
        print("\n\t  ***************\t\n\t    On the end:\t\n\t  ***************\t\n\t<deleting process...>\t\n") //TEST
        print("number of entities in CoreData: \(manageContext!.registeredObjects.count)\n") //TEST
        /// RB: na wszelki wypadek wszystko usówam pod koniec działania ViewController. Wynika to z paru potyczek, które miałem wcześniej. Muszę jeszcze rozkminić lepiej kontrolę nad danymi
        for point:RBPoint in (pointArrayController.arrangedObjects as? [RBPoint])! {
            
            manageContext?.deleteObject(point as NSManagedObject)
        }
        do {
            try manageContext?.save()
        } catch let error as NSError {
            print(error)
        }
        print("\nnumber of entities in CoreData: \(manageContext!.registeredObjects.count)")//TEST
        

    }

}

