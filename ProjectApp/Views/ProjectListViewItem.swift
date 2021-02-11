//
//  ProjectListViewItem.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectListViewItem: View {
    
    var project: Project
    
    var body: some View {
        VStack {
            VStack {
                if let image = project.headerImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } else if let projectColor = project.headerColor {
                    Color(projectColor)
                    
                }
            }
            .frame(height: 117)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color.greySecondary, lineWidth: 1)
            )
            
            Spacer()
            
            HStack {
                Text(project.title)
                    .font(Font(Style.FontStyle.body))
                    .foregroundColor(.darkText)
                Spacer()
                Text("\(project.date.formattedProjectDate())")
                    .font(Font(Style.FontStyle.header2))
                    .foregroundColor(.brandOrange)
            }
            .padding(.horizontal, .margin)
            Spacer()
        }
        .frame(height: 163)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.greySecondary, lineWidth: 1)
        )
        .padding(.horizontal, .margin)
    }
}


struct ProjectListViewItem_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListViewItem(project: Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp", header: UIImage(named: "test")!))
    }
}
