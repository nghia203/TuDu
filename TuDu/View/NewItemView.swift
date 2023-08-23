//
//  NewItemView.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewmodel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New item")
                .font(.system(size:30))
                .bold()
                .padding()
            Form {
                //title
                TextField("Title", text: $viewmodel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //due date
                          DatePicker("Due date", selection: $viewmodel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                          TLButton(title: "Save", background: .pink) {
                              if viewmodel.canSave {
                                  viewmodel.save()
                                  newItemPresented = false
                              } else {
                                  viewmodel.showAlert = true
                              }
                }
                    .padding()
                    .alert(isPresented: $viewmodel.showAlert) {
                        Alert(title: Text("Error"), message: Text("Please check if your title and due date are valid or not."))
                    }
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
