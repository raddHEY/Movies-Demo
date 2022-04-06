//
//  ProfileView.swift
//  TDD Demo
//
//  Created by crazypicklerick on 01/04/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: GoogleLogin
    
    private let user = GIDSignIn.sharedInstance.currentUser
    
    private let deviceID = UIDevice.current.identifierForVendor!.uuidString
    
    let creationDate = Auth.auth().currentUser?.metadata.creationDate
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color("Grey")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Text(user?.profile?.name ?? "")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        
                        NetworkImage(url: user?.profile?.imageURL(withDimension: 400))
                            .frame(width: 200, height: 200, alignment: .center)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                            .padding()
                    }
                    Spacer()
                    
                    VStack(spacing: 60)  {
                        
                        HStack  {
                            Text("Subscription Date: ")
                                .foregroundColor(Color.white)
                            Text(creationDate!, style: .date)
                                .font(.body)
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                            
                        }
                        
                        HStack  {
                            
                            Text("Device ID: ")
                                .foregroundColor(Color.white)
                            Text(deviceID)
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                        }
                    }
                    .frame(alignment: .leading)
                    
                    Spacer()
                    
                    VStack  {
                        
                        Text(user?.profile?.email ?? "")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        
                        Button(action: viewModel.googleLogout) {
                            Text("Sign out")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.systemIndigo))
                                .cornerRadius(12)
                                .padding()
                        }
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: GoogleLogin
    
    static var previews: some View {
        ProfileView()
            .environmentObject(GoogleLogin())
    }
}
