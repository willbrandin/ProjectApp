//
//  ModalCalendarPicker.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ModalCalendarPicker: View {
    
    var onSave: () -> Void = {}
    @Binding var date: Date
    
    var body: some View {
        VStack {
            DatePicker("Select a Date", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding()
            
            Button("Save Date", action: onSave)
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct ModalCalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        ModalCalendarPicker(date: .constant(Date()))
    }
}
