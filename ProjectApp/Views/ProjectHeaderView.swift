//
//  ProjectHeaderView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectHeaderView: View {
    
    var project: Project
    var height: CGFloat = 163
    
    var body: some View {
        VStack {
            if let image = project.headerImage {
                Image(uiImage: image)
            } else if let color = project.headerColor {
                Color(color)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.greySecondary, lineWidth: 1)
        )
        .padding(.horizontal, .margin)
        .frame(height: height)
    }
}


struct ProjectHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectHeaderView(project: Project(id: UUID(), date: Date(), title: "iOS Dev Challenge", description: "I was number 1 in Texas for Lord of the Rings on QuizUp", header: ProjectColor.blue))
            .previewLayout(.sizeThatFits)
    }
}
