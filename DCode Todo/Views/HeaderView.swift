//
//  HeaderView.swift
//  TODO
//
//  Created by Akito Daiki on 12/7/2566 BE.
//

import SwiftUI

struct HeaderView: View {
    
    let title : String
    let subtitle : String
    let angle : Double
    let angle2 : Double
    let background : Color
    let background2 : Color
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 60)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                .opacity(0.6)
            Capsule()
                .foregroundColor(background2)
                .rotationEffect(Angle(degrees: angle2))
                .opacity(0.7)
            
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.primary)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.primary)
            }
            .padding(.top,80)
        }
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subtitle: "Subtitle",
                   angle: -48,
                   angle2: 60,
                   background: .mint,
                   background2: .orange)
    }
}
//            RoundedRectangle(cornerRadius: 100)
//                .foregroundColor(background2)
//                .rotationEffect(Angle(degrees: angle2))
//                .opacity(0.5)
