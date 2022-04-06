//
//  TDD_DemoApp.swift
//  TDD Demo
//
//  Created by crazypicklerick on 25/03/22.
//

import SwiftUI
import Firebase


@main
struct TDD_DemoApp: App {
    
    init()  {
        setupGoogleLogin()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}

extension TDD_DemoApp {
    
    private func setupGoogleLogin() {
        FirebaseApp.configure()
    }
}
