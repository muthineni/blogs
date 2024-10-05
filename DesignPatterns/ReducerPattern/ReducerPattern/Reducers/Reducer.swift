//
//  Reducer.swift
//  ReducerPattern
//
//  Created by Sridhar Muthineni on 04/10/2024.
//

import Foundation

func personReducer(state: AppState, action: PersonAction) -> AppState {
    switch action {
    case .loadPerson(let person):
        state.person = person
        return state
    }
}
