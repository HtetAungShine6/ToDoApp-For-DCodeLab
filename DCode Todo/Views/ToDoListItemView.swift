//
//  ToDoListItemView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
            HStack{
                Button{
                    viewModel.toggleIsDone(item: item)
                }label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(item.isDone ? .mint : .orange)
                }.animation(.easeIn(duration: 0.5))
                
                VStack(alignment: .leading){
                    Text(item.title)
                        .font(.title3)
                        .bold()
                    Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                        .foregroundColor(Color(.secondaryLabel))
                }
                .padding()
                .strikethrough(item.isDone ? true : false)
                .foregroundColor(item.isDone ? .orange : .black)
                .animation(.easeOut(duration: 0.5))
                Spacer()
            }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123",
                                     title: "Get Milk",
                                     dueDate: Date().timeIntervalSince1970,
                                     createdDate: Date().timeIntervalSince1970,
                                     isDone: false))
    }
}

