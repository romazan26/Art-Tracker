//
//  SaleForTimeView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct PurchaseFortimeView: View {
    
    @StateObject var vm: CollectionsViewModel
    
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            //Color.clear.edgesIgnoringSafeArea(.all)
            List {
                if vm.purchaseEntry.isEmpty{
                    CollectionEmptyView()
                        .listRowBackground(Color.clear)
                        
                }else{
                    
                    // Группировка покупок по дате
                    ForEach(vm.groupedPurchasesByDate().keys.sorted(by: >), id: \.self) { dateKey in
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
                            ForEach(vm.groupedPurchasesByDate()[dateKey] ?? []) { purchase in
                                PurchaseCellView(purchase: purchase) // Используем кастомную ячейку
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(InsetGroupedListStyle())
            .frame(maxWidth: .infinity)
            
        }.frame(maxWidth: .infinity)
        
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        PurchaseFortimeView(vm: CollectionsViewModel())
    }
}

// Кастомный модификатор для того, чтобы сделать фон списка прозрачным
struct ClearBackgroundListView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            UITableView.appearance().backgroundColor = .clear // Прозрачный фон для UITableView
            UITableViewCell.appearance().backgroundColor = .clear // Прозрачный фон для ячеек
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

