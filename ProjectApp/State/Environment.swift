//
//  Environment.swift
//  WidgetQuotes
//
//  Created by Will Brandin on 1/10/21.
//

import Foundation

var Current = AppEnvironment()

struct AppEnvironment {
    var uuid = { UUID() }
    
}
