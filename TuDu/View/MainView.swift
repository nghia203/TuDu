//
//  ContentView.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 09/08/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewmodel = MainViewViewModel()
    var body: some View {
        if viewmodel.isSignin, !viewmodel.currentUserID.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
        @ViewBuilder
    var accountView: some View {
        //log in
        TabView {
            ToDoListView(userId: viewmodel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
