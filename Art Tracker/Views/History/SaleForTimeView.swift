//
//  SaleForTimeView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct SaleForTimeView: View {
    
    @StateObject var vm: CollectionsViewModel
    
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            List {
                if vm.saleEntry.isEmpty{
                    CollectionEmptyView()
                        .listRowBackground(Color.clear)
                }else{
                    
                    // Группировка покупок по дате
                    ForEach(vm.groupedSalesByDate().keys.sorted(by: >), id: \.self) { dateKey in
                        Section(header:
                                    HStack {
                            Spacer()
                            Text(dateKey).font(.headline)
                                .foregroundStyle(.white)
                                .padding(12)
                            Spacer()
                        }
                            .background(content: {
                                Color.second.cornerRadius(12)
                            })
                        )
                        {
                            // Для каждой покупки в группе
                            ForEach(vm.groupedSalesByDate()[dateKey] ?? []) { purchase in
                                SaleCellView(purchase: purchase) // Используем кастомную ячейку
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
            
        }
    }
}

#Preview {
    SaleForTimeView(vm: CollectionsViewModel())
}
