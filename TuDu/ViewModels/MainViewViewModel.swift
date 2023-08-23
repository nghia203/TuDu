//
//  MainViewViewModel.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""}
            }
    }
    
    public var isSignin: Bool {
        return Auth.auth().currentUser != nil
    }
    
}
