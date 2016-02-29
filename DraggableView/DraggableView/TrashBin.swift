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
    
    internal func restoreAllStatus(){
        for var garbage in garbages {
            garbage.status = .Alive
        }
    }
    //grash Delegate
    func trash<T:TrashAble>(var trash:T){
        trash.status = .Trashed
        self.garbages.append(trash)
    }
}
