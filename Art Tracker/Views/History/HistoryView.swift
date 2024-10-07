//
//  HistoryView.swift
//  Art Tracker
//
//  Created by Роман on 02.10.2024.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var vm: CollectionsViewModel
    
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack(alignment: .leading,spacing: 20) {
                HStack {
                    Spacer()
                    //MARK: - Add Purhcase button
                    Button {
                        vm.isPresentAddHistory = false
                    } label: {
                        Text("Add")
                            .foregroundStyle(.white)
                            .padding(12)
                            .background(Color.second.cornerRadius(15))
                    }
                }
                //MARK: - View title
                Text("History")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .heavy))
                
                //MARK: - Switch sale
                CustomSwithHistoryView(simpleHistoryView: $vm.simpleHistoryView)
                
                //MARK: - History
                    if vm.simpleHistoryView {
                        SaleForTimeView(vm: vm)
                    }
                    //MARK: Purchase
                    else{
                        PurchaseFortimeView(vm: vm)
                    }

                Spacer()
            }.padding()
        }
        .sheet(isPresented: $vm.isPresentAddHistory) {
            AddHistory(vm: vm)
        }
    }
}

#Preview {
    HistoryView(vm: CollectionsViewModel())
}
