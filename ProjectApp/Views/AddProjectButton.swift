//
//  AddProjectButton.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/11/21.
//

import SwiftUI

struct AddProjectButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    var onTapAdd: () -> Void = {}
    
    var body: some View {
        ZStack {
            Color.secondaryBackground
            
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
