//
//  AddImageView.swift
//  Milestone13-15_PhotoCollection
//
//  Created by HUA Cindy on 13/02/2025.
//

import SwiftUI
import PhotosUI

struct AddImageView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var viewModel: ViewModel
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var name: String = ""
    @State private var imageData: Data = Data()
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $pickerItem) {
                    if let selectedImage = selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFit()
                            .padding()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                            .frame(width: 300, height: 300)
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: pickerItem, loadImage)
                
                TextField("Name", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .navigationTitle("Add new image")
            .toolbar {
                Button("Save") {
                    viewModel.addImage(imageData: imageData, name: name)
                    dismiss()
                }
            }
        }
    }
    
    func loadImage() {
        Task {
            if let pickerItem = pickerItem {
                do {
                    if let data = try await pickerItem.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            selectedImage = Image(uiImage: uiImage)
                            imageData = data
                        }
                    }
                } catch {
                    print("Failed to load image: \(error)")
                }
            }
        }
    }
}

//#Preview {
//    AddImageView()
//}
