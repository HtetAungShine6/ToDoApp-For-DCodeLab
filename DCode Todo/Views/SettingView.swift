//
//  SettingView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import SwiftUI

struct SettingView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView{
            
            Form{
                //view profile
                Section(header: Text("Profile").bold()) {
                    NavigationLink(destination: ProfileView()) {
                        Text("View Profile")
                            .foregroundColor(Color.mint)
                            .bold()
                    }
                }
                
                //light mode or dark mode?
                Section(header: Text("📲DISPLAY📲").bold(),
                        footer: Text("System setting will use the current device theme.").bold()){
                    Toggle(isOn: $isDarkMode,
                           label: {
                        Text("Dark Mode")
                            .foregroundColor(Color.mint)
                            .bold()
                    })
                    .onChange(of: isDarkMode){ _ in
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                    }
                }
                
                //language view
                Section(header: Text("Language").bold()) {
                    NavigationLink(destination: LanguageSelectionView()) {
                        Text("Change Language")
                            .foregroundColor(Color.mint)
                            .bold()
                    }
                }
                
                //attempting log out
                Section(footer: Text("Please press the button to sign out! 👀")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)){
                    Button(action: viewModel.logOut,
                           label: {
                        Text("Log Out")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .tint(.red)
                    })
                }
            }
            .navigationTitle("Setting")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
