//
//  ProgressCircleView.swift
//  Art Tracker
//
//  Created by Роман on 02.10.2024.
//

import SwiftUI

struct ProgressCircleView: View {
    var progress: Float = 0.3
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.2)
                .foregroundStyle(.white.opacity(0.2))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.main)
                .rotationEffect(Angle(degrees: 270))
        }
    }
}

#Preview {
    ProgressCircleView()
}
