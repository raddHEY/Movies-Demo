//
//  MovieDetailView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 05/04/22.
//

import SwiftUI

struct MovieCardView: View {
    
    @State var movie: Movie
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20)   {
            Image(uiImage: movie.image!)
                .resizable()
        }
        .background(Color("Grey"))
        .frame(width: 100, height: 160)
        .animation(.easeInOut(duration: 0.5))
        .transition(.opacity)
        .scaledToFill()
        .cornerRadius(15)
        .shadow(radius: 15)
    }
}



struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: Movie.sampleData[0])
    }
}
