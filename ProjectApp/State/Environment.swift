//
//  Environment.swift
//  WidgetQuotes
//
//  Created by Will Brandin on 1/10/21.
//

import Foundation

#if DEBUG
var Current = AppEnvironment()
#else
let Current = AppEnvironment()
#endif
 
struct AppEnvironment {
    var uuid = { UUID() }
    
    var dateFormatter: () -> DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .autoupdatingCurrent
        formatter.locale = .autoupdatingCurrent
        formatter.calendar = .autoupdatingCurrent
        return formatter
    }
    
    var saveProjects: ([Project]) -> Void = {
        UserDefaultsManager.projects = $0
    }
    
    var getProjects: () -> [Project] = {
        UserDefaultsManager.projects
    }
}
