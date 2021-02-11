//
//  ProjectListView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectListView: View {
    
    var projects: [Project] = [
        Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp. Not only that but I am currently binge listening to the Drive soundtrack", header: .brown)
    ]
    
    @State var createProjectActive = false
    @State var viewProjectActive = false

    var contentView: some View {
        LazyVStack(spacing: .marginXL) {
            NavigationHeader(title: "Projects")
            
            ForEach(projects) { project in
                NavigationLink(destination: ProjectView(project: project, isNavigationActive: $viewProjectActive), isActive: $viewProjectActive) {
                    ProjectListViewItem(project: project)
                }
            }
        
            AddProjectButton(onTapAdd: { createProjectActive = true })
        }
    }
    
    var body: some View {
        ZStack {
            NavigationLink(
                destination: CreateProjectView(isCreateNavigationActive: $createProjectActive),
                isActive: $createProjectActive,
                label: {
                    EmptyView()
                })
            
            Color.tintedWhite
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                contentView
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView(projects: [
            Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp", header: ProjectColor.blue),
            Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp", header: ProjectColor.purple)
        ])
    }
}

struct AddProjectButton: View {
    
    var onTapAdd: () -> Void = {}
    
    var body: some View {
        ZStack {
            Color.white
            
            Button(action: onTapAdd) {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image("plus")
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.greySecondary, lineWidth: 1)
        )
        .padding(.horizontal, .margin)
        .frame(height: 163)
    }
}
