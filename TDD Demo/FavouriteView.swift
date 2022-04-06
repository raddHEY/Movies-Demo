//
//  FavouriteView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 05/04/22.
//

import SwiftUI
import GoogleSignIn

struct FavouriteView: View {
    
    @Binding var movies: [Movie]
    
    var favourite: [Bool] = [Bool](repeating: false, count: 10)
    
    @EnvironmentObject var viewModel: GoogleLogin
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        NavigationView {
            VStack  {
                VStack  {
                    Text(user?.profile?.name ?? "Your Favourite")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                    
                    List  {
                        ForEach($movies) { $movie in
                            
                            
                            if(movie.fav)   {
                                
                                NavigationLink(destination: MovieView(movie: $movie)) {
                                    
                                    MovieCardView(movie: movie)
                                    
                                    Text(movie.title)
                                        .font(.headline)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.white)
                                }
                                .listRowBackground(Color("Grey"))
                            }
                        }
                    }
                }
            }
            .background(Color("Grey"))
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView(movies: .constant(Movie.sampleData))
    }
}
