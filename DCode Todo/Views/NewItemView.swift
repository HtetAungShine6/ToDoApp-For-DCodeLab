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
            Text("Add Your Todos")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form{
                //Title of telling users to add todos
                TextField("Enter your todos here! 📝", text: $viewModel.title)
                    .font(.title3)
                //due date
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
            //showing alert to user if something is empty
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("📆Please select the date that is newer than yesterday!🙏"))
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
