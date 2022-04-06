//
//  HomeView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 29/03/22.
//

import SwiftUI
import GoogleSignIn

struct DashboardView: View {
    
    @Binding var movies: [Movie]
    
    @EnvironmentObject var viewModel: GoogleLogin
    @Environment(\.scenePhase) private var scenePhase
    private let user = GIDSignIn.sharedInstance.currentUser
    
    @State private var addMovieView = false
    @State private var newMovieData = Movie.Data()
    let saveAction: ()->Void
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack  {
                Color("Grey").edgesIgnoringSafeArea(.all)
                VStack  {
                    HStack  {
                        Text("Movies")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination:
                                        ProfileView()
                                        .environmentObject(GoogleLogin()))  {
                            NetworkImage(url: user?.profile?.imageURL(withDimension: 100))
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding()
                        }
                    }
                    
                    VStack {
                        Text("Now Playing")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        ScrollView(.horizontal) {
                            LazyHStack  {
                                ForEach($movies) { $movie in
                                    NavigationLink(destination: MovieView(movie: $movie)) {
                                        MovieCardView(movie: movie)
                                    }
                                }
                                .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                                .listRowSeparator(.hidden)
                            }
                        }
                    }
                    
                    VStack {
                        Text("New Release")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        
                        ScrollView(.horizontal) {
                            LazyHStack  {
                                ForEach($movies) { $movie in
                                    NavigationLink(destination: MovieView(movie: $movie)) {
                                        MovieCardView(movie: movie)
                                    }
                                }
                                .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                                .listRowSeparator(.hidden)
                            }
                        }
                    }
                    VStack {
                        Text("Favourite")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        
                        ScrollView(.horizontal) {
                            LazyHStack  {
                                ForEach($movies) { $movie in
                                    
                                    if(movie.fav)   {
                                        
                                        NavigationLink(destination: MovieView(movie: $movie)) {
                                            MovieCardView(movie: movie)
                                        }
                                    }
                                }
                                .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                                .listRowSeparator(.hidden)
                            }
                        }
                    }
                }
                HStack {
                    Button(action: {
                        addMovieView = true
                    })  {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .padding()
                    }
                }
                .frame(width: 80, height: 80)
                .offset(x: 165, y: 320)
            }
            .background(Color("Grey"))
            .sheet(isPresented: $addMovieView) {
                NavigationView  {
                    MovieEditView(data: $newMovieData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    addMovieView = false
                                    newMovieData = Movie.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newMovie = Movie(data: newMovieData)
                                    movies.append(newMovie)
                                    addMovieView = false
                                    newMovieData = Movie.Data()
                                }
                            }
                        }
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
    
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(movies: .constant(Movie.sampleData), saveAction: {})
    }
}


