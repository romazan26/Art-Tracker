//
//  ArraySaleCellView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct ArraySaleCellView: View {
    @ObservedObject var entry: Entry
    var body: some View {
        HStack {
            if let image = entry.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: scaleScreen_x(44), height: scaleScreen_x(44))
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
            }else{
                Image(systemName: "photo.artframe")
                    .resizable()
                    .frame(width: scaleScreen_x(44), height: scaleScreen_x(44))
                    .foregroundStyle(.gray)
            }
            Text(entry.titleWork ?? "")
                .foregroundStyle(.white)
                .font(.system(size: 17, weight: .bold))
                .padding()
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    ArraySaleCellView(entry: Entry())
}
