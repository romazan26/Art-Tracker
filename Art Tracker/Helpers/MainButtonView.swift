//
//  MainButtonView.swift
//  Art Tracker
//
//  Created by Роман on 01.10.2024.
//

import SwiftUI

struct MainButtonView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.main)
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: scaleScreen_x(17), weight: .bold))
        }.frame(width: .infinity, height: scaleScreen_x(50))
    }
}

#Preview {
    MainButtonView(text: "Next")
}
