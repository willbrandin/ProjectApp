//
//  ProjectListView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectListContainer: View {
    
    @EnvironmentObject var store: AppStore

    var body: some View {
        ProjectListView(projects: store.state.projects,
                        createProjectActive: Binding(
                            get: { return store.state.navigationState.isCreateProjectNavActive },
                            set: { store.dispatch(action: .addProjectActive($0)) }
                        ),
                        viewProjectActive: Binding(
                            get: { return store.state.navigationState.isViewProjectNavActive },
                            set: { store.dispatch(action: .viewProjectActive($0)) }
                        ))
    }
}

struct ProjectListView: View {
    
    var projects: [Project]
    
    @Binding var createProjectActive: Bool
    @Binding var viewProjectActive: Bool
    
    @State var viewProjectTest: UUID? = nil

    var contentView: some View {
        LazyVStack(spacing: .marginXL) {
            NavigationHeader(title: "Projects")
            
            ForEach(projects) { project in
                NavigationLink(
                    destination: ProjectView(project: project,
                                             isNavigationActive: Binding(get: { return viewProjectTest != nil },
                                                                         set: { viewProjectTest = $0 ? project.id : nil })),
                    tag: project.id,
                    selection: $viewProjectTest,
                    label: { ProjectListViewItem(project: project) })
            }
        
            AddProjectButton(onTapAdd: { createProjectActive = true })
        }
    }
    
    var body: some View {
        ZStack {
            NavigationLink(
                destination: CreateProjectContainerView(),
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
            Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp", header: UIImage(named: "test")!)
        ], createProjectActive: .constant(false), viewProjectActive: .constant(false))
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
