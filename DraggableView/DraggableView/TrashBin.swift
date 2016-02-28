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
        self.backgroundColor = UIColor.grayColor()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func trash<T:TrashAble>(var trash:T){
        trash.status = .Trashed
        if let trashView = trash as? UIView {
            trashView.trashAnimation()
        }
        self.garbages.append(trash)
    }
}
