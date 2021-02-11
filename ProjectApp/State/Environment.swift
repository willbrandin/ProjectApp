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

class UserDefaultsManager {
    private static let userProjectsKey = "userProjectsKey"
    
    static var projects: [Project] {
        get {
            if let savedProjects = UserDefaults.standard.object(forKey: userProjectsKey) as? Data {
                let decoder = JSONDecoder()
                if let decodedProjects = try? decoder.decode([Project].self, from: savedProjects) {
                    return decodedProjects
                } else {
                    return []
                }
            } else {
                return []
            }
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                let defaults = UserDefaults.standard
                defaults.set(encoded, forKey: userProjectsKey)
            }
        }
    }
}
