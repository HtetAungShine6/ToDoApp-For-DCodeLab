//
//  InfoView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 15/7/2566 BE.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack{
            Image("background").resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Spacer()
                VStack(alignment: .center, spacing: 20){
                    Image("myImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 180, height: 180, alignment: .top)
                        .clipShape(Circle())
                        .shadow(color: .purple, radius: 5, x: 5, y: 5)
                    Text("Htet Aung Shine")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .font(.system(.largeTitle))
                        .foregroundColor(.primary)
                        .shadow(color: .purple, radius: 5)
                    Text("🎒A VMS Student💻")
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                        .shadow(color: .orange, radius: 24)
                    HStack(spacing: 40){
                        Image(systemName: "qrcode")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.primary)
                        Image(systemName: "network")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.primary)
                        Image(systemName: "laptopcomputer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.primary)
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.primary)
                    }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50, alignment: .center)
                    .shadow(color: .pink, radius: 10, y: 5)
                }
                Spacer()
                VStack(alignment: .center, spacing: 30){
                    RoundedRectangle(cornerRadius: 120)
                        .frame(width: 240, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: .purple, radius: 10, x: 10, y: 5)
                        .overlay(
                            Text("Freddy")
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                                .foregroundColor(.orange)
                        )
                    HStack(alignment: .center, spacing: 60){
                        VStack{
                            Text("21/12/99")
                                .font(.system(size: 18))
                                .foregroundColor(.primary)
                            Text("Birthday")
                                .font(.system(size: 15))
                                .foregroundColor(.purple)
                        }
                        VStack{
                            Text("Myanmar")
                                .font(.system(size: 18))
                                .foregroundColor(.primary)
                            Text("Region")
                                .font(.system(size: 15))
                                .foregroundColor(.purple)
                        }
                        VStack{
                            Text("BlackPink")
                                .font(.system(size: 18))
                                .foregroundColor(.primary)
                            Text("Bias")
                                .font(.system(size: 15))
                                .foregroundColor(.purple)
                        }
                    }
                    Text("Skills🧑🏻‍💻")
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                        .font(.system(size: 30))
                    Text("Html, Css, Java Script, Java, Kotlin, Python, Swift")
                        .font(.system(.title2))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
