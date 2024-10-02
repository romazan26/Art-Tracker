//
//  BudgetView.swift
//  Art Tracker
//
//  Created by Роман on 02.10.2024.
//

import SwiftUI

struct BudgetView: View {
    var budget: Int
    var body: some View {
        ZStack {
            Color.second.cornerRadius(20)
            VStack(spacing: 10) {
                Text("$\(budget)")
                    .font(.system(size: 34, weight: .heavy))
                Text("your budget")
                    .font(.system(size: 13))
            }.foregroundStyle(.white)
        }
        .frame(height: scaleScreen_y(102))
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    BudgetView(budget: 0)
}
