//
//  ProjectHeaderSelector.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ColorPickerRow: View {
    
    @Binding var pickedImage: UIImage?
    @Binding var selectedColor: ProjectColor?
    
    var body: some View {
        HStack(spacing: .margin) {
            ForEach(ProjectColor.allCases) { color in
                Button(action: {
                    selectedColor = color
                    pickedImage = nil
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
    
    @State var showImagePicker: Bool = false
    @State var pickedImage: UIImage? = nil

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
                ColorPickerRow(pickedImage: $pickedImage, selectedColor: $selectedColor)
                    .padding(.bottom, .margin)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.greySecondary, lineWidth: 1)
        )
        .padding(.horizontal, .margin)
        .frame(height: 163)
        .sheet(isPresented: $showImagePicker, onDismiss: {
            self.showImagePicker = false
        }, content: {
            ImagePicker(image: Binding(
                            get: {
                                return self.pickedImage
                            },
                            set: {
                                self.pickedImage = $0
                                self.selectedColor = nil
                            }),
                        isShown: self.$showImagePicker)
        })
    }
}

struct ProjectHeaderSelector_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProjectHeaderSelector(selectedColor: .constant(nil))
            ProjectHeaderSelector(selectedColor: .constant(.blue))
        }
    }
}
