//
//  TitledTextView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/11/21.
//

import SwiftUI

struct TitledTextField: View {
    
    var title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: .margin) {
                Text(title)
                    .font(Font(Style.FontStyle.header))
                
                TextField("Type here", text: $text)
                    .font(Font(Style.FontStyle.body))
                    .foregroundColor(.textPrimary)
                    .padding(.padding)
                    .background(Color.secondaryBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8).stroke(Color.greySecondary, lineWidth: 1)
                    )
            }
            
            Spacer()
        }
        .padding(.horizontal, .margin)
        .padding(.top, .marginXL)
    }
}
