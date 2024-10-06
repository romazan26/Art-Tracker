//
//  imageAndTextView.swift
//  Art Tracker
//
//  Created by Роман on 06.10.2024.
//

import SwiftUI

struct imageAndTextView: View {
    var imageName = ""
    var text = ""
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundStyle(.main)
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 16))
        }
    }
}

#Preview {
    imageAndTextView(imageName: "calendar", text: "April, 08")
        .padding(9)
        .background {
            Color.black.cornerRadius(12)
        }
}
