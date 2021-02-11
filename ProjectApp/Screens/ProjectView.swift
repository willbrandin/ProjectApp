//
//  ProjectView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectViewTextDetail: View {
    var title: String
    var detail: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: .margin) {
                Text(title)
                    .font(Font(Style.FontStyle.header))
                Text(detail)
                    .font(Font(Style.FontStyle.body))
            }
            
            Spacer()
        }
        .padding(.horizontal, .margin)
        .padding(.top, .marginXL)
    }
}

struct ProjectView: View {
    
    var project: Project
    @Binding var isNavigationActive: Bool
    
    var body: some View {
        ZStack {
            Color.primaryBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                NavigationBindableHeader(title: "Create Project", isNavigationActive: $isNavigationActive)
                ProjectHeaderView(project: project, height: 163)
                ProjectDateView(date: project.date)
                    .padding(.top, .marginXL)
                
                ProjectViewTextDetail(title: "Title", detail: project.title)
                ProjectViewTextDetail(title: "Description", detail: project.description)

                Spacer()
            }
        }
        .navigationBarTitle("Project")
        .navigationBarHidden(true)
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(project: Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp", header: ProjectColor.blue), isNavigationActive: .constant(true))
    }
}
