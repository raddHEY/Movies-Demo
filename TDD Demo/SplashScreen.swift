//
//  SplashScreen.swift
//  TDD Demo
//
//  Created by crazypicklerick on 25/03/22.
//

import SwiftUI

struct SplashScreen: View {
    
    @StateObject var viewModel = GoogleLogin()
    
    @State private var showMainView = false
    @State private var angle: Double = 360
    @State private var opacity: Double = 1
    @State private var scale: CGFloat = 1
    var body: some View {
        
        Group   {
            if showMainView {
                ContentView()
                    .environmentObject(viewModel)
            }   else    {
                ZStack {
                    Color("LaunchBackground")
                        .edgesIgnoringSafeArea(.all)
                    Image("LaunchIcon")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .rotation3DEffect(
                            .degrees(angle), axis: (x: 0.0, y: 1.0, z: 0.0))
                        .opacity(opacity)
                        .scaleEffect(scale)
                }
            }
        }
        .onAppear   {
            withAnimation(.linear(duration: 2)) {
                angle = 0
                scale = 7
                opacity = 0.5
            }
            
            withAnimation(Animation.linear.delay(1.8)) {
                showMainView = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
