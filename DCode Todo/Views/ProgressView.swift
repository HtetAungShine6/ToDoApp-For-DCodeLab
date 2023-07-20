//
//  ProgressView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 20/7/2566 BE.
//

import SwiftUI

struct ProgressView: View {
    let totalItems: Int
    let completedItems: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.secondary)
                    .frame(width: geometry.size.width, height: 10)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(width: CGFloat(geometry.size.width) * CGFloat(completedItems) / CGFloat(totalItems), height: 10)
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(totalItems: 3, completedItems: 1)
    }
}
