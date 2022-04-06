//
//  MovieEditView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 05/04/22.
//

import SwiftUI

struct MovieEditView: View {
    
    @Binding var data: Movie.Data
    @State var showImagePicker: Bool = false
    @State var image: Image? = nil
    @State private var newArtistName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                HStack {
                    Text("Title: ")
                    TextField("Title", text: $data.title)
                }
                HStack {
                    Text("Description: ")
                    TextField("Description", text: $data.description)
                        .frame(height: 3.0)
                }
                HStack  {
                    Text("Ratings: ")
                    HStack {
                        Slider(value: $data.rating, in: 0...10, step: 0.1) {
                            Text("Rating")
                        }
                        .accessibilityValue("\(data.rating, specifier: "%.1f") /10")
                        Spacer()
                        Text("\(data.rating, specifier: "%.1f") /10")
                            .accessibilityHidden(true)
                    }
                }
                HStack {
                    Text("Genere: ")
                    TextField("Genere", text: $data.genere)
                }
                HStack {
                    Text("Add Image")
                    Spacer()
                    Button(action: {
                        self.showImagePicker.toggle()
                    })  {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(height: 30)
                .sheet(isPresented: $showImagePicker)   {
                    ImagePicker(sourceType: .photoLibrary)  { image in
                        self.image = Image(uiImage: image)
                    }
                }
                image?.resizable().frame(width: 100, height: 100)
            }
            Section(header: Text("Cast")) {
                ForEach(data.cast) { Artist in
                    Text(Artist.name)
                }
                .onDelete { indices in
                    data.cast.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Member", text: $newArtistName)
                    Button(action: {
                        withAnimation {
                            let Artist = Movie.Artist(name: newArtistName)
                            data.cast.append(Artist)
                            newArtistName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Artist")
                    }
                    .disabled(newArtistName.isEmpty)
                }
                
            }
        }
        .background(Color("Grey"))
    }
}

struct MovieEditView_Previews: PreviewProvider {
    static var previews: some View {
        MovieEditView(data: .constant(Movie.sampleData[0].data))
    }
}
