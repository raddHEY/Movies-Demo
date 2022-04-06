//
//  MovieView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 05/04/22.
//

import SwiftUI

struct MovieView: View {
    
    @Binding var movie: Movie
    
    var body: some View {
        
        NavigationView  {
            
            ZStack {
                Image(uiImage: movie.image!)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)
                
                Image("FilmGrain")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack  {
                    
                    HStack (spacing: 20)   {
                        Image(uiImage: movie.image!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 300, height: 320)
                    .animation(.easeInOut(duration: 0.75))
                    .transition(.opacity)
                    .scaledToFill()
                    .cornerRadius(15)
                    .shadow(radius: 15)
                    
                    Text(movie.title)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .foregroundColor(Color.white)
                        .padding()
                    
                    HStack {
                        Text(movie.description)
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: UIScreen.main.bounds.size.width)
                    
                    
                    VStack  {
                        HStack {
                            Text("Genere: \(movie.genere)")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .padding(.horizontal)
                            
                            Spacer()
                                    .frame(width: 50)
                            
                            ZStack {
                                Circle()
                                    .trim(from: 0, to: CGFloat(movie.rating/10))
                                    .stroke(Color.yellow, lineWidth: 4)
                                    .frame(width: 50)
                                    .rotationEffect(.degrees(-90))
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(Color.yellow.opacity(0.2), lineWidth: 4)
                                    .frame(width: 50)
                                    .rotationEffect(.degrees(-90))
                                Text(String.init(format: "%0.1f", movie.rating ))
                                    .font(.subheadline)
                                    .foregroundColor(.yellow)
                                
                            }

                        }
                        Spacer()
                                .frame(height: 20)
                        
                        VStack {
                            Text("Cast: ")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                                    .frame(height: 10)
                            
                            HStack  {
                                ForEach(movie.cast) { Artist in
                                    Text(Artist.name)
                                    Text(" ")
                                }
                                .foregroundColor(Color.white)
                            }
                            .padding()
                        }
                        .padding(.bottom)
                    }
                }
            }
        }
        .toolbar    {
            ToolbarItemGroup(placement: .navigationBarTrailing)  {
                if movie.fav==true {
                    Button  {
                        movie.fav = false
                        movie.updatefav(from: movie.data)
                        
                    } label:  {
                        Image(systemName: "heart.fill")
                    }
                } else {
                    Button{
                        movie.fav = true
                        movie.updatefav(from: movie.data)
                    } label: {
                        Image(systemName: "heart")
                    }
                }
                
                Button  {
                    //trashed(movie)
                } label: {
                    Image(systemName: "trash")
                }
                .padding()
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: .constant(Movie.sampleData[0]))
            .previewInterfaceOrientation(.portrait)
    }
}
