//
//  ProfileView.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewmodel = ProfileViewViewModel()
    init() {
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewmodel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewmodel.fetchUser()
        }
        
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        //avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        // info
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack {
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        //sign out
        Button("Log Out") {
            viewmodel.logout()
        }
        .padding()
        .tint(.red)
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
