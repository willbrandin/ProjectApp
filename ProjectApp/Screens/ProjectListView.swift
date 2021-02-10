//
//  ProjectListView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectListView: View {
    
    var projects: [Project] = []
    
    var body: some View {
        ZStack {
            Color.tintedWhite
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack(spacing: .marginXL) {
                    Text("Create Project")
                        .font(Font(Style.FontStyle.title))
                        .foregroundColor(.darkTitle)
                        .padding(.top, .margin)
                        .padding(.bottom, .marginMax + .margin)
                    
                    ForEach(projects) { project in
                        Button(action: { }) {
                            ProjectListViewItem(project: project)
                        }
                    }
                
                    AddProjectButton(onTapAdd: {})
                }
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
                Image("plus")
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
