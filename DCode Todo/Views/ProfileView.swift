//
//  ProfileView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    //    init(){
    //        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemMint]
    //    }
    var body: some View {
        //        NavigationView{
        VStack{
            if let user = viewModel.user{
                profile(user: user)
            }else{
                Text("Loading Profile ... ")
                    .foregroundColor(Color.orange)
            }
        }
        .foregroundColor(Color.orange)
        
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        VStack(alignment: .center){
            Image("profile")
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.mint)
                .frame(width: 150, height: 180)
                .padding()
            
            Text("Account Information")
                .font(.title)
                .bold()
                
            List{
    //            VStack(alignment: .leading){
    //
    //            }
                HStack{
                    Text("Id : ")
                        .bold()
                        .foregroundColor(Color.mint)
                    Text(user.id)
                }
                .padding()
                HStack{
                    Text("Name : ")
                        .bold()
                        .foregroundColor(Color.mint)
                    Text(user.name)
                }
                .padding()
                HStack{
                    Text("Email : ")
                        .bold()
                        .foregroundColor(Color.mint)
                    Text(user.email)
                }
                .padding()
                HStack{
                    Text("Account opened date : ")
                        .bold()
                        .foregroundColor(Color.mint)
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                .padding()
            }.listStyle(.insetGrouped)
//            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
