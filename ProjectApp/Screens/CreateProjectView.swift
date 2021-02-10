//
//  CreateProjectView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct CreateProjectView: View {
    
    var project: Project
    
    @State var date = Date()
    @State var selectedColor: ProjectColor?
    @State var selectedImage: UIImage?
    @State var calendarActive: Bool = false
    @State var titleText = ""
    @State var description = ""
    
    var body: some View {
        ZStack {
            Color.tintedWhite
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            
            VStack {
                VStack {
                    Text("Create Project")
                        .font(Font(Style.FontStyle.title))
                        .foregroundColor(.darkTitle)
                        .padding(.top, .margin)
                        .padding(.bottom, .marginMax + .margin)
                    
                    ProjectHeaderSelector(selectedColor: $selectedColor)
                    
                    ProjectDateView(date: date, action: { calendarActive = true })
                        .padding(.top, .marginXL)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: .margin) {
                            Text("Title")
                                .font(Font(Style.FontStyle.header))
                            
                            TextField("Type here", text: $titleText)
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
                    
                    HStack {
                        VStack(alignment: .leading, spacing: .margin) {
                            Text("Description")
                                .font(Font(Style.FontStyle.header))
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $description)
                                    .font(Font(Style.FontStyle.body))
                                    .padding(.padding)
                                    .background(Color.white)
                                    .foregroundColor(.darkText)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8).stroke(Color.greySecondary, lineWidth: 1)
                                    )
                                    .frame(height: 57)
                                
                                if description == "" {
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
                    .padding(.top, .marginXL)
                    
                    Spacer()
                }
                
                Button("Save", action: { print("Hello") })
                    .buttonStyle(PrimaryButtonStyle())
                    
            }
            .blur(radius: calendarActive ? 8 : 0)
            .animation(.interactiveSpring())
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            
            if calendarActive {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        calendarActive = false
                    }
                
                ModalCalendarPicker(onSave: { calendarActive = false }, date: $date)
            }
        }
        
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView(project: Project(id: UUID(), date: Date(), title: "", description: "", header: nil))
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
