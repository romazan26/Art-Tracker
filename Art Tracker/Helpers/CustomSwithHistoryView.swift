//
//  CustomSwithHistoryView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct CustomSwithHistoryView: View {
    @Binding var simpleHistoryView: Bool
    var body: some View {
        ZStack {
            Color.second.cornerRadius(7)
            HStack{
                Button {
                    simpleHistoryView = true
                } label: {
                    ZStack {
                        Color(simpleHistoryView ? .gray : .second)
                            .cornerRadius(7)
                        Text("Sale")
                            .foregroundStyle(.white)
                            .font(.system(size: scaleScreen_x(13)))
                    }
                }
                Button {
                    simpleHistoryView = false
                } label: {
                    ZStack {
                        Color(!simpleHistoryView ? .gray : .second)
                            .cornerRadius(7)
                        Text("Purchase")
                            .foregroundStyle(.white)
                            .font(.system(size: scaleScreen_x(13)))
                    }
                }

            }
        }.frame(height: scaleScreen_y(24))
    }
}

#Preview {
    CustomSwithHistoryView(simpleHistoryView: .constant(false))
}
