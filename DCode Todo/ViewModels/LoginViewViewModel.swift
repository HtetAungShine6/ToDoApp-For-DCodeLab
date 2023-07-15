//
//  LoginViewViewModel.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import Foundation
import FirebaseAuth //for logging in with email and psw

class LoginViewViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    init(){}
    
    func login(){
        guard validate()
        else{
            return
        }
        
        //LogIn
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.showAlert = true
            } else {
                // Login successful
                // You can perform additional actions here, such as navigating to another screen
            }
        }
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please fill in all fields"
            showAlert = true
            return false
        }
        
        //email validate
        guard email.contains("@") && email.contains(".")
        else{
            errorMessage = "Please enter a valid email"
            showAlert = true
            return false
        }
        return true
    }
}
