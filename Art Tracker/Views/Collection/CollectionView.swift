//
//  CollectionView.swift
//  Art Tracker
//
//  Created by Роман on 01.10.2024.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack {
                
                //MARK: - User
                HStack {
                    Spacer()
                    Text("Mr. Alex")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundStyle(.white)
                    Image(.userTest)
                        .resizable()
                        .frame(width: scaleScreen_x(40), height: scaleScreen_x(40))
                }
                
                //MARK: - Collection
                VStack {
                    HStack{
                        Text("Collection")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .heavy))
                        Spacer()
                        Text("See all")
                            .foregroundStyle(.main)
                            .font(.system(size: 15))
                    }
                    CollectionEmptyView()
                }
                //MARK: - Collection
                VStack {
                    HStack{
                        Text("Statistics")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .heavy))
                        Spacer()
                    }
                    BudgetView(budget: 0)
                    SaleStatisticsView(sale: 0, purchases: 0)
                }
                //MARK: - Collection
                VStack {
                    HStack{
                        Text("Notes")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .heavy))
                        Spacer()
                        Text("See all")
                            .foregroundStyle(.main)
                            .font(.system(size: 15))
                    }
                    CollectionEmptyView()
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    CollectionView()
}
