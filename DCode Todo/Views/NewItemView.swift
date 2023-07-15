//
//  NewItemView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form{
                //Title
                TextField("Enter your todos here! 📝", text: $viewModel.title)
                    .font(.title3)
                //Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .tint(.mint)
                //button
                TLButton(title: "Save", background: .mint){
                    if(viewModel.canSave){
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer!"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get:{
            return true
        },set: { _ in
            
        }
        ))
    }
}
