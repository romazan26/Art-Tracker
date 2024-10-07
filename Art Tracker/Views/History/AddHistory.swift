//
//  AddHistory.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct AddHistory: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: CollectionsViewModel
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack(alignment: .leading,spacing: 20) {
                VStack{
                    //MARK: - View title
                    Text("Add an entry")
                        .foregroundStyle(.white)
                        .font(.system(size: 30, weight: .heavy))
                    
                    //MARK: - Switch sale
                    CustomSwithHistoryView(simpleHistoryView: $vm.switchAddHistory)
                    
                    //MARK: - Price and date
                    HStack{
                        VStack(alignment: .leading){
                            Text("The amount")
                                .foregroundStyle(.gray)
                            CustomTextFieldView(text: vm.switchAddHistory ?  $vm.simplePriceSale : $vm.simplePricePurchase)
                                
                        }
                        VStack{
                            Text("Date")
                                .foregroundStyle(.gray)
                            DatePicker("", selection: $vm.simpleDatePurchase, displayedComponents: .date)
                                .colorScheme(.dark)
                        }
                    }
                }
                .padding(10)
                .background {
                    Color.second.cornerRadius(16)
                }
                
                //MARK: - Collection
                VStack(alignment: .leading,spacing: 20){
                    Text("Collection")
                        .foregroundStyle(.gray)
                    if vm.switchAddHistory{
                        if vm.arrayForSale.isEmpty{
                            CollectionEmptyView()
                        }else{
                            ForEach(vm.arrayForSale) { sale in
                                HStack {
                                    Button {
                                        vm.simpleEntry = sale
                                    } label: {
                                        Image(systemName: vm.simpleEntry == sale ? "checkmark.circle.fill" : "circle")
                                            .foregroundStyle(.main)
                                    }

                                    ArraySaleCellView(entry: sale)
                                    Spacer()
                                }
                            }
                        }
                    }
                    if !vm.switchAddHistory{
                        if vm.arrayForPurchase.isEmpty{
                            CollectionEmptyView()
                        }else{
                            ForEach(vm.arrayForPurchase) { purchase in
                                HStack {
                                    Button {
                                        vm.simpleEntry = purchase
                                    } label: {
                                        Image(systemName: vm.simpleEntry == purchase ? "checkmark.circle.fill" : "circle")
                                            .foregroundStyle(.main)
                                    }
                                    ArraySaleCellView(entry: purchase)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .padding(10)
                .background {
                    Color.second.cornerRadius(16)
                }
                Spacer()
                
                //MARK: - Save button
                Button {
                    if vm.switchAddHistory{
                        vm.saleEntryPurchase()
                    }else{
                        vm.buyEntry()
                    }
                    dismiss()
                    //vm.isPresentAddEntry = false
                } label: {
                    MainButtonView(text: "Save")
                }

                
            }.padding()
        }
        .onAppear {
            vm.getArrayForPurchase()
        }
    }
}

#Preview {
    AddHistory(vm: CollectionsViewModel())
}
