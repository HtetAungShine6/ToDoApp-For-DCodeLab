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

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
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
                .listStyle(.automatic)
            }
            .navigationTitle("To Do List")
            .foregroundColor(Color.primary)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        viewModel.showingNewItemView = true
                    }
                    .tint(.mint)
                }
            }
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
