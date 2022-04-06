//
//  NewView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 05/04/22.
//

import SwiftUI
import GoogleSignIn
import Firebase

struct HomeView: View {
    
    @EnvironmentObject var viewModel: GoogleLogin
    private let user = GIDSignIn.sharedInstance.currentUser
    private let img = NetworkImage(url: GIDSignIn.sharedInstance.currentUser?.profile?.imageURL(withDimension: 50))

    
    var body: some View {
        TabView {
            DashboardView(movies: .constant(Movie.sampleData), saveAction: {})
                .tabItem    {
                    Image(systemName: "film")
                    Text("Movies")
                }
            FavouriteView(movies: .constant(Movie.sampleData))
                .tabItem    {
                    Image(systemName: "heart.fill")
                    Text("Favourite")
                }
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(GoogleLogin())
    }
}
