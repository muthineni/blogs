//
//  Store.swift
//  ReducerPattern
//
//  Created by Sridhar Muthineni on 04/10/2024.
//

import Foundation

class Store<State, Action> {
    private var state: State
    private let reducer: (State, Action) -> State
    private var listeners: [(State) -> Void] = []
    
    
    init(initialState: State, reducer: @escaping (State, Action) -> State) {
        self.state = initialState
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
        listeners.forEach { $0(state) }
    }
    
    func getState() -> State {
        return state
    }
    
    func subscribe(listener: @escaping (State) -> Void) {
        listeners.append(listener)
    }
}
