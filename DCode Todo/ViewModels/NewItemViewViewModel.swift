//
//  NewItemViewViewModel.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){
        
    }
    
    func save(){
        guard canSave else{
            return
        }
        //Get current user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //Save a model to database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
//    func edit(item: ToDoListItem) {
//        title = item.title
//        dueDate = Date(timeIntervalSince1970: item.dueDate)
//    }

    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}


//func edit(){
//    guard let uId = Auth.auth().currentUser?.uid else{
//        return
//    }
//    let userId = UUID().uuidString
//    let items = ToDoListItem(id: userId,
//                            title: title,
//                            dueDate: dueDate.timeIntervalSince1970,
//                            createdDate: Date().timeIntervalSince1970,
//                            isDone: false)
//
//    let db = Firestore.firestore()
//    db.collection("users")
//        .document(uId)
//        .collection("todos")
//        .document(userId)
//        .updateData(items.asDictionary())
//}
