//
//  CreateProjectView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
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
                    .foregroundColor(.darkText)
                    .padding(.padding)
                    .background(Color.white)
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

struct CreateProjectView: View {
        
    @State var date = Date()
    @State var selectedColor: ProjectColor?
    @State var selectedImage: UIImage?
    @State var calendarActive: Bool = false
    @State var titleText = ""
    @State var description = ""
    
    @Binding var isCreateNavigationActive: Bool
    
    var contentView: some View {
        VStack {
            NavigationBindableHeader(title: "Create Project", isNavigationActive: $isCreateNavigationActive)
            ProjectHeaderSelector(selectedColor: $selectedColor)
            ProjectDateView(date: date, action: { calendarActive = true })
                .padding(.top, .marginXL)
            
            TitledTextField(title: "Title", text: $titleText)
            DescriptionTextEditor(text: $description)
            
            Spacer()
            
            Button("Save", action: { isCreateNavigationActive = false })
                .buttonStyle(PrimaryButtonStyle())
        }
    }
    
    var body: some View {
        ZStack {
            Color.tintedWhite
                .edgesIgnoringSafeArea(.all)
            
            contentView
                .blur(radius: calendarActive ? 8 : 0)
                .animation(.interactiveSpring())
               
            if calendarActive {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        calendarActive = false
                    }
                
                ModalCalendarPicker(onSave: { calendarActive = false }, date: $date)
            }
        }
        .navigationBarTitle("Create Project")
        .navigationBarHidden(true)
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView(isCreateNavigationActive: .constant(true))
    }
}
