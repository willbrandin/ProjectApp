//
//  File.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/11/21.
//

import SwiftUI

struct DescriptionTextEditor: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: .margin) {
                Text("Description")
                    .font(Font(Style.FontStyle.header))
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .font(Font(Style.FontStyle.body))
                        .padding(.padding)
                        .background(Color.white)
                        .foregroundColor(.darkText)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke(Color.greySecondary, lineWidth: 1)
                        )
                        .frame(height: 57)
                    
                    if text == "" {
                        Text("Type here")
                            .font(Font(Style.FontStyle.body))
                            .padding(.padding)
                            .foregroundColor(.greyPrimary)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, .margin)
        .padding(.vertical, .marginXL)
    }
}
