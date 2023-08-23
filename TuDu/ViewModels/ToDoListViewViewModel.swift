//
//  ToDoListViewViewModel.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//
//

//list of items view

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel : ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    init (userId: String) {
        self.userId = userId
    }
    
    //delete item
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
