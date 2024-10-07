//
//  NoteCellView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct NoteCellView: View {
    @ObservedObject var note: Note
    var body: some View {
        ZStack {
            Color.second.cornerRadius(16)
            VStack(alignment: .leading) {
                Text(note.titleNote ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .heavy))
                Text(note.descriptNote ?? "")
                    .foregroundStyle(.gray)
                    .font(.system(size: 13))
            }
            .padding()
        }.frame(height: scaleScreen_y(110))
    }
}

#Preview {
    NoteCellView(note: Note())
}
