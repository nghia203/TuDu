//
//  LoginViewViewModel.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import FirebaseAuth
import Foundation
    
class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") &&  email.contains(".") else {
            errorMessage = "This email is not valid"
            return false
        }
        return true
    }
}
