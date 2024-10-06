//
//  EntryCellview.swift
//  Art Tracker
//
//  Created by Роман on 04.10.2024.
//

import SwiftUI

struct EntryCellview: View {
    @ObservedObject var entry: Entry
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let image = entry.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: scaleScreen_x(140), height: scaleScreen_x(140))
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
            }
            Text(entry.titleWork ?? "")
                .foregroundStyle(.white)
                .font(.system(size: 15, weight: .bold))
                .padding()
        }.frame(width: scaleScreen_x(140), height: scaleScreen_x(140))
    }
}

#Preview {
    EntryCellview(entry: Entry())
}
