//
//  PurchaseCellView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct PurchaseCellView: View {
    let purchase: Entry
    var body: some View {
        ZStack {
            Color.second.cornerRadius(12)
            HStack {
                //MARK: - Image
                VStack {
                    if let image = purchase.image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: scaleScreen_x(72), height: scaleScreen_x(72))
                            .cornerRadius(8)
                    }else {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .frame(width: scaleScreen_x(72), height: scaleScreen_x(72))
                            .foregroundStyle(.gray)
                            .cornerRadius(8)
                    }
                   
                    Text("Purchase")
                        .foregroundStyle(.white)
                        .padding(4)
                        .background {
                            Color.main
                                .cornerRadius(12)
                                .frame(width: scaleScreen_x(72))
                        }
                }
                
                //MARK: - Devider
                Rectangle()
                    .frame(width: 1, height: scaleScreen_y(104))
                    .foregroundStyle(.main)
                
                //MARK: - Info purchase
                VStack{
                    Text(purchase.titleWork ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        VStack(spacing: 7){
                            Text("The amount")
                                .foregroundStyle(.gray)
                            Text("$\(purchase.pricePurchase)")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    }
                }
                
            }
            .padding()
        }.frame(height: scaleScreen_y(136))
    }
}

#Preview {
    PurchaseCellView(purchase: Entry())
}
