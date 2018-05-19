//
//  Proxy.swift
//  Worm
//
//  Created by huluobo on 2018/4/27.
//

import Foundation

public final class Proxy<Input, Output> {
    private var block: ((Input) -> Output?)?
    
    public func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        self.block = { [weak target] input in
            guard let target = target else { return nil }
            return block?(target, input)
        }
    }
    
    public func proxy(_ input: Input) -> Output? {
        return block?(input)
    }
}

public extension Proxy where Input == Void {
    func proxy() -> Output? {
        return block?(())
    }
}

