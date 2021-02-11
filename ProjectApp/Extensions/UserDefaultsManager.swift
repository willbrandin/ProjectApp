//
//  UserDefaultsManager.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/11/21.
//

import Foundation

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
