//
//  ToDoListItemViewViewModel.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

//list of single item view (each row of items list)
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel : ObservableObject {
    init () {}
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }

}
