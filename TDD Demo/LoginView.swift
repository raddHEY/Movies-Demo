//
//  LoginView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 25/03/22.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    
    @EnvironmentObject var viewModel: GoogleLogin
    
    var body: some View {
        ZStack  {
            Image("LoginBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("FilmLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(
                        Circle()
                            .fill(Color("Grey"))
                            .frame(width: 800, height: 400)
                            .scaleEffect(2, anchor: .bottom)
                            .offset(y: -40)
                            .opacity(0.7)
                        )
                Spacer()
                
            }
            Image("FilmGrain")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 40)   {
                Spacer()
                    .frame(height: 275)
                Text("Mechcubei")
                    .font(.system(size: 60))
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                Text("Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...  ")
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding()
                Text("To Watch Now")
                    .font(.title)
                    .foregroundColor(Color.gray)
                
                GoogleSignInButton()
                    .frame(width: 270, height: 50)
                    .onTapGesture {
                        viewModel.googleLogin()
                    }
                Text("By continuing, you are agreeing to our Terms of Service")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct GoogleSignInButton: UIViewRepresentable  {
    
    @Environment(\.colorScheme) var colorScheme
    
    private var button = GIDSignInButton()
    
    func makeUIView(context: Context) -> GIDSignInButton    {
        button.colorScheme = colorScheme == .dark ? .dark : .light
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
        button.colorScheme = colorScheme == .dark ? .dark : .light
    }
}



