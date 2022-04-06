//
//  ContentView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 25/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings = false
    
    @EnvironmentObject var viewModel: GoogleLogin
    
    var body: some View {
        
        switch viewModel.state {
            
        case .signedIn: HomeView()
        case .signedOut: LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
