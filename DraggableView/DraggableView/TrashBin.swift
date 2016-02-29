//
//  TrashBin.swift
//  DraggableView
//
//  Created by sidawang on 2/27/16.
//  Copyright © 2016 sidex. All rights reserved.
//

import UIKit
//like UITableView have UITableDelegate
class TrashBin: UIView, TrashDelegate{
    var garbages = [TrashAble]()
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.yellowColor()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.yellowColor()
    }
    
    func animateTrash<T:UIView where T:TrashAble>(trash:T){
            trash.animateToZero()
    }
    
    internal func restoreAll(){
        for (index,garbage) in garbages.enumerate() {
            print("index: \(index) garbage: \(garbage)")
            restoreTrash(garbage)
        }
    }
    
    func restoreTrash(var trash:TrashAble){
        guard garbages.count > 0 else{ return }
        //guard garbages.count > index else { return }
        trash.status = .Alive
        let findIndex = garbages.indexOf {
            let trashConcrete = $0 as? UIView
            let trashPassedIn = trash as? UIView
            return trashConcrete == trashPassedIn
        }
        if findIndex != nil {
            garbages.removeAtIndex(findIndex!)
        }
    }

    //grash Delegate
    func trash<T:TrashAble>(var trash:T){
        trash.status = .Trashed
        self.garbages.append(trash)
    }
}
