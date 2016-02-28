//
//  CustomProtocols.swift
//  DraggableView
//
//  Created by sidawang on 2/27/16.
//  Copyright © 2016 sidex. All rights reserved.
//

import Foundation
import UIKit

enum ExistStatus:Int{
    case Alive = 0
    case Trashed
}

protocol Draggable{
    var dragGestureRecognizer:UIPanGestureRecognizer{get}
}

protocol TrashAble{
    var status:ExistStatus{get set}
}

protocol TrashDelegate{
    //this function should trash the object status and return a bool indicate if process success or not
    //TODO: throw exception if not trashable.
    //typealias T
    func trash<T:TrashAble>(var trash:T)
}