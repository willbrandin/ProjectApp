//
//  CreateProjectView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct CreateProjectContainerView: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        CreateProjectView(
            titleText: Binding(
                get: { return store.state.createProjectState.title },
                set: { store.dispatch(action: .didUpdateTitle($0)) }
            ),
            description: Binding(
                get: { return store.state.createProjectState.description },
                set: { store.dispatch(action: .didUpdateDescription($0)) }
            ),
            date: Binding(
                get: { return store.state.createProjectState.date },
                set: { store.dispatch(action: .didSelectDate($0)) }
            ),
            isCreateNavigationActive: Binding(
                get: { return store.state.navigationState.isCreateProjectNavActive },
                set: { store.dispatch(action: .addProjectActive($0)) }
            ), selectedColor: Binding(
                get: { return store.state.createProjectState.selectedColor },
                set: { store.dispatch(action: .colorSelected($0)) }
            ), selectedImage: Binding(
                get: { return store.state.createProjectState.selectedImage },
                set: { store.dispatch(action: .didSelectImage($0)) }
            ), calendarActive: Binding(
                get: { return store.state.createProjectState.isCalendarPresented },
                set: { store.dispatch(action: .setCalendarActive($0)) }
            ), imagePickerActive: Binding(
                get: { return store.state.createProjectState.isImagePresented },
                set: { store.dispatch(action: .pickImageActive($0)) }
            ),
            error: Binding(
                get: { return store.state.createProjectState.error },
                set: { store.dispatch(action: .setError($0)) }
            ),
            saveAction: { store.dispatch(action: .saveProject) }
        )
    }
}

struct CreateProjectView: View {
        
    @Binding var titleText: String
    @Binding var description: String
    @Binding var date: Date?
    @Binding var isCreateNavigationActive: Bool
    
    @Binding var selectedColor: ProjectColor?
    @Binding var selectedImage: UIImage?
    @Binding var calendarActive: Bool
    @Binding var imagePickerActive: Bool
    
    @Binding var error: String?
    
    var saveAction: () -> Void
    
    var contentView: some View {
        VStack {
            NavigationBindableHeader(title: "Create Project", isNavigationActive: $isCreateNavigationActive)
            ProjectHeaderSelector(showImagePicker: $imagePickerActive, pickedImage: $selectedImage, selectedColor: $selectedColor)
            ProjectDateView(date: date, action: { calendarActive = true })
                .padding(.top, .marginXL)
            
            TitledTextField(title: "Title", text: $titleText)
            DescriptionTextEditor(text: $description)
            
            Spacer()
            
            Button("Save", action: saveAction)
                .buttonStyle(PrimaryButtonStyle())
        }
        .alert(isPresented: Binding(get: { return error != nil },
                                    set: { _ in error = nil })) {
            Alert(title: Text(error!))
        }
    }
    
    var body: some View {
        ZStack {
            Color.primaryBackground
                .edgesIgnoringSafeArea(.all)
            
            contentView
                .blur(radius: calendarActive ? 8 : 0)
               
            if calendarActive {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        calendarActive = false
                    }
                
                ModalCalendarPicker(date: $date)
            }
        }
        .navigationBarTitle("Create Project")
        .navigationBarHidden(true)
    }
}
