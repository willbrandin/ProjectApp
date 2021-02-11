//
//  ProjectDateView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ProjectDateView: View {
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    var date: Date?
    var action: (() -> Void)?
    
    @State private var selectedDate = Date()
    
    var body: some View {
        Button(action: { action?() }) {
            HStack(spacing: .padding) {
                Image("calendar")
                
                if let date = date {
                    Text("\(date, formatter: Self.taskDateFormat)")
                        .font(Font(Style.FontStyle.header2))
                        .foregroundColor(.brandOrange)
                } else {
                    Text("Add date & time")
                        .font(Font(Style.FontStyle.header2))
                        .foregroundColor(.brandOrange)
                }
            }
            .padding(.vertical, .margin)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color.greySecondary, lineWidth: 1)
            )
            .padding(.horizontal, .margin)
        }
        .allowsHitTesting(action != nil)
    }
}

struct ProjectDateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProjectDateView(date: Date(), action: {})
                .previewLayout(.sizeThatFits)
            
            ProjectDateView(date: Date())
                .previewLayout(.sizeThatFits)
            
            ProjectDateView(action: { })
                .previewLayout(.sizeThatFits)
        }
    }
}
