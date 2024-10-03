//
//  CustomTextFieldView.swift
//  Art Tracker
//
//  Created by Роман on 03.10.2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    var placeholder = "Text"
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white.opacity(0.05)
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.white)
        }
        .cornerRadius(12)
        .frame(maxWidth: .infinity)
        .frame(height: scaleScreen_y(54))
    }
}

#Preview {
    CustomTextFieldView( text: .constant(""))
}
