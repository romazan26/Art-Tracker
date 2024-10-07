//
//  CollectionView.swift
//  Art Tracker
//
//  Created by Роман on 01.10.2024.
//

import SwiftUI

struct CollectionView: View {
    @StateObject var vm: CollectionsViewModel
    @StateObject var vmNote = NoteViewModel()
    @StateObject var vmUser = UserViewModel()
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack {
                
                //MARK: - User
                HStack {
                    Spacer()
                    Text(vmUser.userName)
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundStyle(.white)
                    Button {
                        vmUser.isPresentUser = true
                    } label: {
                        Image(.userTest)
                            .resizable()
                            .frame(width: scaleScreen_x(40), height: scaleScreen_x(40))
                    }

                    
                }
                
                //MARK: - Collection
                VStack {
                    HStack{
                        Text("Collection")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .heavy))
                        Spacer()
                        
                        //MARK: - See all button
                        NavigationLink {
                            CollectionsSortView(vm: vm)
                        } label: {
                            Text("See all")
                                .foregroundStyle(.main)
                                .font(.system(size: 15))
                        }

                        
                    }
                    if vm.entrys.isEmpty{
                        CollectionEmptyView()
                    }else{
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(vm.entrys.prefix(3)) { entry in
                                    NavigationLink {
                                        EntryView(vm: vm, entry: entry)
                                    } label: {
                                        EntryCellview(entry: entry)
                                    }                                    
                                }
                            }
                        }
                    }
                }
                //MARK: - Statistics
                VStack {
                    HStack{
                        Text("Statistics")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .heavy))
                        Spacer()
                    }
                    BudgetView(budget: vm.getBudget())
                    SaleStatisticsView(sale: vm.saleEntry.count, purchases: vm.purchaseEntry.count)
                }
                //MARK: - Notes
                VStack {
                    HStack{
                        Text("Notes")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .heavy))
                        Spacer()
                        NavigationLink {
                            NotesView(vm: vmNote)
                        } label: {
                            Text("See all")
                                .foregroundStyle(.main)
                                .font(.system(size: 15))
                        }
                    }
                    if vmNote.notes.isEmpty{
                        CollectionEmptyView()
                    }else{
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(vmNote.notes) { note in
                                    NoteCellView(note: note)
                                }
                            }
                        }
                    }
                    
                }
                Spacer()
            }.padding()
        }
        .sheet(isPresented: $vmUser.isPresentUser) {
            UserView(vm: vmUser)
                .presentationDetents([.fraction(0.5)])
        }
    }
}

#Preview {
    CollectionView(vm: CollectionsViewModel())
}
