//
//  RegisterView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        
        NavigationView{
            VStack{
                
                //header view
                HeaderView(title: "Register",
                           subtitle: "Start organizing todos",
                           angle: 42,
                           angle2: -30,
                           background: .orange,
                           background2: .mint)
                
                //register form
                Form{
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.primary)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.primary)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.primary)
                    TLButton(title: "Create an account", background: .orange){
                        //attempting registration
                        viewModel.register()
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

