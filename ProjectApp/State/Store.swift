//
//  Store.swift
//  WidgetQuotes
//
//  Created by Will Brandin on 1/10/21.
//

import Foundation

final class AppStore: ObservableObject {
    @Published private(set) var state: AppState
    
    init(state: AppState = AppState()) {
        self.state = state
    }
    
    public func dispatch(action: AppAction) {
        state = appReducer(state: state, action: action)
    }
}
