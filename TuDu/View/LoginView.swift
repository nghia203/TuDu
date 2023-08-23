//
//  LoginView.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewmodel = LoginViewViewModel()
    @State var password = ""
    
    var body: some View {
        NavigationView() {
            VStack {
                //Header
                HeaderView(title: "TuDu", subtitle: "Always on time", angle: 15, background: .indigo)
                    .padding()
                //Login form
                Form {
                    
                    if !viewmodel.errorMessage.isEmpty {
                        Text(viewmodel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewmodel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in", background: .gray) {
                        viewmodel.login()
                        }
                    .padding(.top, 20)
                
                }
                .offset(y: -150)
                
                
                
                //Create account
                VStack {
                    Text("New here?")
                    
                    //Show registration
                    
                    NavigationLink("Create an account", destination: RegisterView())
                }
                    .padding(.bottom, 10)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
