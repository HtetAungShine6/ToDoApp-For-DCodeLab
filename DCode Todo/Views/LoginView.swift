//
//  LoginView.swift
//  TODO
//
//  Created by Akito Daiki on 11/7/2566 BE.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: -70,
                           angle2: 20,
                           background: .mint,
                           background2: .orange)
                
                //Login Form
                Form{
                    //error message
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.primary)
                    //modifiers
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.primary)
                    
                    TLButton(title: "Log In", background: .mint){
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                //Create Account
                VStack{
                    Text("New user?🤔 Please tap here👇")
                        .foregroundColor(Color.mint)
                    NavigationLink("Create An Account", destination: RegisterView()).tint(.orange)
                }
                .padding(.bottom,40)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
