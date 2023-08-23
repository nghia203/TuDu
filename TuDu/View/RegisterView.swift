//
//  RegisterView.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewmodel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subtitle: "One Step Away", angle: -15, background: .mint)
                .padding()
            
            Form {
                if !viewmodel.errorMessage.isEmpty {
                    Text(viewmodel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TextField("Full name", text: $viewmodel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewmodel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewmodel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Register", background: .gray) {
                    viewmodel.register()
                    }
                .padding(.top, 20)
            }
            .offset(y: -150)
            
            Spacer()
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
