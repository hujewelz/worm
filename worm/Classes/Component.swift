//
//  Component.swift
//  worm
//
//  Created by huluobo on 2018/4/18.
//

import UIKit

public protocol Component {}

public extension Component where Self : UIResponder {
    
    func config<R: Render>(with render: R) where R.View == Self {
        render.rend(self)
    }
}



public protocol Render {
    associatedtype View: Component
    
    func rend(_ component: View)
}
