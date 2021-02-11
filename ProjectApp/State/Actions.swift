//
//  Actions.swift
//  WidgetQuotes
//
//  Created by Will Brandin on 1/10/21.
//

import UIKit

enum AppAction {
    case addProjectActive(Bool)
    case colorSelected(ProjectColor)
    case pickImageActive(Bool)
    case didSelectImage(UIImage)
    case didSelectDate(Date)
    case didUpdateTitle(String)
    case didUpdateDescription(String)
    case saveProject(Project)
    case projectsLoaded([Project])
    case viewProject(Project)
}
