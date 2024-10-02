//
//  SaleStatisticsView.swift
//  Art Tracker
//
//  Created by Роман on 02.10.2024.
//

import SwiftUI

struct SaleStatisticsView: View {
    var sale: Int
    var purchases: Int
    var body: some View {
        ZStack {
            Color.second.cornerRadius(20)
            HStack {
                Spacer()
                //MARK: - Sale
                VStack {
                    Text("\(sale)")
                        .foregroundStyle(.main)
                        .font(.system(size: 34, weight: .heavy))
                    Text("Sale")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13))
                }
                Spacer()
                //MARK: Circle progress sale
                ProgressCircleView(progress: getProgress())
                Spacer()
                //MARK: - Purchase
                VStack {
                    Text("\(purchases)")
                        .foregroundStyle(.white.opacity(0.2))
                        .font(.system(size: 34, weight: .heavy))
                    Text("Purchase")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13))
                }
                Spacer()
            }.padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: scaleScreen_y(89))
    }
    
    private func getProgress() -> Float{
        let progress = Float(sale) / Float(purchases)
        return progress
    }
}

#Preview {
    SaleStatisticsView(sale: 4, purchases: 10)
}
