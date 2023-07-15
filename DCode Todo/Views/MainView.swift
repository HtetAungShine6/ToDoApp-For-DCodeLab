//
//  ContentView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //signed in
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            SettingView()
                .tabItem{
                    Label("Setting", systemImage: "gearshape.fill")
                    
                }
            InfoView()
                .tabItem{
                    Label("About", systemImage: "info.circle.fill")
                }
        }
        .tint(.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
