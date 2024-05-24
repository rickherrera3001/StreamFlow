//
//  ProfileView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 23/05/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 18/255, green: 31/255, blue: 61/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Profile")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                        .padding()
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding()
                        .shadow(radius: 5)
                    
                    Text("Select Profile Photo")
                        .foregroundColor(.green)
                    
                    Text("Ricardo")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("rihr.3001@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.green)
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle sign out action
                    }) {
                        Text("Cerrar Sesión")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 20)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

#Preview {
    ProfileView()
}

