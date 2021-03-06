//
//  PrimaryButton.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font(Style.FontStyle.header))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 43)
            .background(Color.brandBlue)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .opacity(configuration.isPressed ? 0.4 : 1)
            .shadow(
                color: Color(UIColor(hexString: "A1B1EA")).opacity(colorScheme == .dark ? 0 : 1),
                radius: colorScheme == .dark ? 0 : 20,
                x: 0,
                y: colorScheme == .dark ? 0 : 5)
            .padding(.horizontal, .marginXL)
            .padding(.bottom, .margin)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Save", action: {})
            .buttonStyle(PrimaryButtonStyle())
            .previewLayout(.sizeThatFits)
    }
}
