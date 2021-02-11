//
//  NavigationHeader.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct NavigationHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(Font(Style.FontStyle.title))
            .foregroundColor(.darkTitle)
            .padding(.top, .margin)
            .padding(.bottom, .marginMax)
    }
}

struct NavigationBindableHeader: View {
    
    var title: String
    @Binding var isNavigationActive: Bool
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: { isNavigationActive = false }) {
                    Image("back-arrow")
                }
                .padding(.margin)

                Spacer()
            }
            
            Text(title)
                .font(Font(Style.FontStyle.title))
                .foregroundColor(.darkTitle)
                
        }
        .padding(.bottom, .marginMax)
    }
}
