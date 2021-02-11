//
//  ProjectHeaderSelector.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ColorPickerRow: View {
    
    @Binding var selectedColor: ProjectColor?
    
    var body: some View {
        HStack(spacing: .margin) {
            ForEach(ProjectColor.allCases) { color in
                Button(action: {
                    selectedColor = color
                }) {
                    ZStack {
                        Color(color.colorRepresentation)
                            .clipShape(Circle())
                            .frame(width: 30, height: 30)
                            .overlay(
                                Circle().stroke(selectedColor == color ? Color.darkText : .clear, lineWidth: 1)
                            )
                        
                        if selectedColor == color {
                            Image("check")
                        }
                    }
                }
            }
        }
    }
}

struct ImageSelectorButton: View {
    
    @Binding var showImagePicker: Bool
    
    var body: some View {
        Button(action: { showImagePicker = true }) {
            HStack {
                Spacer()
                
                VStack {
                    Spacer()
                    Image("share")
                    Text("Upload header image or choose color")
                        .font(Font(Style.FontStyle.caption))
                        .foregroundColor(.greyPrimary)
                        .padding(.bottom, .marginXL)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct ProjectHeaderSelector: View {
    
    @Binding var showImagePicker: Bool
    @Binding var pickedImage: UIImage?
    @Binding var selectedColor: ProjectColor?
    
    var body: some View {
        ZStack {
            VStack {
                if let image = pickedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 163)

                } else if let selectedColor = selectedColor {
                    Color(selectedColor.colorRepresentation)
                } else {
                    Color.white
                }
            }
            
            ImageSelectorButton(showImagePicker: $showImagePicker)
            
            VStack {
                Spacer()
                ColorPickerRow(selectedColor: $selectedColor)
                    .padding(.bottom, .margin)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.greySecondary, lineWidth: 1)
        )
        .padding(.horizontal, .margin)
        .frame(height: 163)
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: $pickedImage, isShown: self.$showImagePicker)
        })
    }
}
