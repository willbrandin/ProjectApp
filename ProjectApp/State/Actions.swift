//
//  Actions.swift
//  WidgetQuotes
//
//  Created by Will Brandin on 1/10/21.
//

import UIKit

enum AppAction {
    // Navigation Actions
    case addProjectActive(Bool)
    case viewProjectActive(Bool)
    
    // Create Actions
    case colorSelected(ProjectColor?)
    case pickImageActive(Bool)
    case didSelectImage(UIImage?)
    case didSelectDate(Date?)
    case setCalendarActive(Bool)
    case didUpdateTitle(String)
    case didUpdateDescription(String)
    case saveProject
    case setError(String?)
    
    // Loading Projects
    case loadProjects
}
