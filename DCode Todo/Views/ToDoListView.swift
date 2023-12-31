//
//  ToDoListView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import SwiftUI

import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]

    //ToDoListView can access and retrieve user-specific todo items from Firestore
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    //listing each items with ToDoListItemView
                    ForEach(items) { item in
                        ToDoListItemView(item: item)
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(Color.orange)
                                .animation(.easeOut(duration: 0.5))
                            }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .foregroundColor(Color.primary)
            //add todo lists items
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        viewModel.showingNewItemView = true
                    }
                    .tint(.mint)
                }
            }
            //presenting the add view sheet AKA NewItemView
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}


struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "HXDbNU2Mf0W87AR8ULbBHq0ec9i1")
    }
}
