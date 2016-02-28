//
//  ViewController.swift
//  DraggableView
//
//  Created by sidawang on 2/27/16.
//  Copyright © 2016 sidex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var trashBin : TrashBin?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addNewView = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addNew:"))
        let restoreTrashedViews = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("restore:"))
        
        self.navigationItem.title = "trash machine"
        self.navigationItem.leftBarButtonItem = addNewView
        self.navigationItem.rightBarButtonItem = restoreTrashedViews
        
        
        let dView = WSDDraggableView(frame: CGRectMake(10,100,100,100))
        dView.text = "Label"
        let trashBin = TrashBin(frame: CGRectMake(200, 200, 200, 200))
        dView.trashDelegate = trashBin
        
        self.trashBin = trashBin
        self.view.addSubview(trashBin)
        self.view.addSubview(dView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNew(barButton:UIBarButtonItem){
        let newView = WSDDraggableView(frame: CGRectMake(10,100,100,100))
        self.view.addSubview(newView)
        newView.trashDelegate = self.trashBin
    }
    @IBAction func restore(barButton:UIBarButtonItem){
        if let garbages = self.trashBin?.garbages {
            for trash in garbages {
                if let trashView = trash as? WSDDraggableView {
                    trashView.status = .Alive
                    UIView .animateWithDuration(1, animations: { () -> Void in
                        if trashView.recoverRect != nil {
                            trashView.frame = trashView.recoverRect!
                        }
                    })
                }
            }
        }
    }
    
}

