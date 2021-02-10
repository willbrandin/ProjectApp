//
//  ProjectView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectView: View {
    
    var project: Project
    
    var body: some View {
        ZStack {
            Color.tintedWhite
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Create Project")
                    .font(Font(Style.FontStyle.title))
                    .foregroundColor(.darkTitle)
                    .padding(.top, .margin)
                    .padding(.bottom, .marginMax + .margin)
                
                ProjectHeaderView(project: project, height: 163)
                    
                ProjectDateView(date: project.date)
                    .padding(.top, .marginXL)
                
                HStack {
                    VStack(alignment: .leading, spacing: .margin) {
                        Text("Title")
                            .font(Font(Style.FontStyle.header))
                        Text(project.title)
                            .font(Font(Style.FontStyle.body))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, .margin)
                .padding(.top, .marginXL)
                
                HStack {
                    VStack(alignment: .leading, spacing: .margin) {
                        Text("Description")
                            .font(Font(Style.FontStyle.header))
                        Text(project.description)
                            .font(Font(Style.FontStyle.body))
                            .lineSpacing(6)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, .margin)
                .padding(.top, .marginXL)

                Spacer()
            }
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(project: Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp", header: ProjectColor.blue))
    }
}
