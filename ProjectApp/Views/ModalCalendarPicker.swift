//
//  ModalCalendarPicker.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ModalCalendarPicker: View {
    
    @Binding var date: Date?
    @State var localDate = Date()
    
    var body: some View {
        VStack {
            DatePicker("Select a Date", selection: $localDate)
                .datePickerStyle(GraphicalDatePickerStyle())
                .background(Color.secondaryBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding()
            
            Button("Save Date", action: { date = localDate })
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct ModalCalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        ModalCalendarPicker(date: .constant(Date()))
    }
}
