//
//  CollectionEmptyView.swift
//  Art Tracker
//
//  Created by Роман on 02.10.2024.
//

import SwiftUI

struct CollectionEmptyView: View {
    var body: some View {
        ZStack{
            Color.second.cornerRadius(20)
            HStack{
                Image(.horn)
                    .resizable()
                    .frame(width: scaleScreen_x(60), height: scaleScreen_x(60))
                VStack(spacing: 10){
                    Text("Empty")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .heavy))
                    Text("You haven't added any entries")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13))
                }.frame(maxWidth: .infinity)
            }.padding()
        }.frame(width: .infinity, height: scaleScreen_y(140))
    }
}

#Preview {
    CollectionEmptyView()
}
