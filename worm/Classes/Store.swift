//
//  Store.swift
//  Worm
//
//  Created by huluobo on 2018/4/27.
//

import Foundation

public protocol StateType {}
public protocol ActionType {}

public final class Store<S: StateType, A: ActionType> {
    
    public typealias Reducer = (_ sate: S?, _ action: A) -> S
    public typealias Subscriber = (_ newState: S, _ oldState: S?) -> Void
    
    fileprivate let reducer: Reducer
    fileprivate var state: S?
    
    fileprivate var subscriber: Subscriber?
    
    public init(reducer: @escaping Reducer, initialState: S? = nil) {
        self.reducer = reducer
        state = initialState
    }
}

extension Store {
    public func dispatch(_ action: A) {
        let oldState = state
        state = reducer(oldState, action)
        subscriber?(state!, oldState)
    }
    
    public func subscribe(_ subscriber: @escaping Subscriber) {
        self.subscriber = subscriber
    }
    
    public func unsubscribe() {
        subscriber = nil
    }
}
