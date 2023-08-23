//
//  ToDoListView.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewmodel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewmodel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {                            Button("Delete") {
                                    viewmodel.delete(id: item.id)
                        }
                        .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To do list")
            .toolbar {
                Button {
                    //
                    viewmodel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: $viewmodel.showingNewItemView) {
            NewItemView(newItemPresented: $viewmodel.showingNewItemView)
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "QD0OHv4XA7mqeJTUrgXY")
    }
}
