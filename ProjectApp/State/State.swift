//
//  State.swift
//  WidgetQuotes
//
//  Created by Will Brandin on 1/10/21.
//

import Foundation
import SwiftUI

struct NavigationState {
    var isCreateProjectNavActive = false
    var isViewProjectNavActive = false
}

struct CreateProjectState {
    var error: String? // Display Error when cannot init Project
    var title = ""
    var description = ""
    var date: Date?
    var selectedImage: UIImage?
    var selectedColor: ProjectColor?
    var isCalendarPresented: Bool = false
    var isImagePresented: Bool = false
}

struct AppState {
    var projects: [Project] = []
    var navigationState = NavigationState()
    var createProjectState = CreateProjectState()
}

func appReducer(state: AppState, action: AppAction, environment: AppEnvironment = AppEnvironment()) -> AppState {
    var state = state
    
    switch action {
    
    case let .didUpdateTitle(title):
        state.createProjectState.title = title
        
    case let .didUpdateDescription(description):
        state.createProjectState.description = description
        
    case let .didSelectDate(date):
        state.createProjectState.date = date
        state.createProjectState.isCalendarPresented = false

    case let .setCalendarActive(isActive):
        state.createProjectState.isCalendarPresented = isActive
    
    case let .addProjectActive(isActive):
        state.navigationState.isCreateProjectNavActive = isActive
        state.createProjectState = CreateProjectState() // Reset state
        
    case let .viewProjectActive(isActive):
        state.navigationState.isViewProjectNavActive = isActive
        
    case let .colorSelected(color):
        state.createProjectState.selectedColor = color
        state.createProjectState.selectedImage = nil
        
    case let .didSelectImage(image):
        state.createProjectState.selectedImage = image
        state.createProjectState.selectedColor = nil
        
    case let .pickImageActive(isActive):
        state.createProjectState.isImagePresented = isActive
        
    case .saveProject:
        let projectState = state.createProjectState
        
        if projectState.title.isEmpty {
            state.createProjectState.error = "Project title cannot be empty."
        } else if projectState.description.isEmpty {
            state.createProjectState.error = "Project description cannot be empty."
        } else if projectState.selectedColor == nil && projectState.selectedImage == nil {
            state.createProjectState.error = "Please select an image or color for your project."
        } else {
            guard let date = projectState.date else {
                state.createProjectState.error = "Please select a date for your project."
                return state
            }
            
            if let image = projectState.selectedImage {
                let project = Project(id: environment.uuid(), date: date, title: projectState.title, description: projectState.description, header: image)
                state.projects.append(project)
            } else if let color = projectState.selectedColor {
                let project = Project(id: environment.uuid(), date: date, title: projectState.title, description: projectState.description, header: color)
                state.projects.append(project)
            }
            
            state.navigationState.isCreateProjectNavActive = false
            state.createProjectState = CreateProjectState() // Reset state
        }
        
    case let .setError(error):
        state.createProjectState.error = error
        
    case .loadProjects:
        state.projects = []
        
    default:
        fatalError("ACTION NOT HANDLED BY REDUCER")
        break
    }
    
    return state
}
