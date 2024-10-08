//
//  MainView.swift
//  Art Tracker
//
//  Created by Роман on 01.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmCollection = CollectionsViewModel()
    @State private var tabSelection = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainBack.ignoresSafeArea()
                VStack {
                    if !tabSelection {
                        CollectionView(vm: vmCollection)
                    }else{
                        HistoryView(vm: vmCollection)
                    }
                    Spacer()
                    //MARK: - bottom tool bar
                    ZStack {
                        Color.white.opacity(0.05)
                        HStack {
                            Spacer()
                            //MARK: - Collection button
                            Button {
                                tabSelection = false
                            } label: {
                                Image(systemName: "photo.artframe.circle")
                                    .resizable()
                                    .foregroundStyle(tabSelection ? .gray : .main)
                                    .frame(width: scaleScreen_x(30), height: scaleScreen_x(30))
                            }
                            Spacer()
                            
                            //MARK: - Plus button
                            NavigationLink {
                                AddEntryView(vm: vmCollection)
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .foregroundStyle(.main)
                                    .frame(width: scaleScreen_x(40), height: scaleScreen_x(40))
                            }      
                            
                            Spacer()
                            //MARK: - Histori button
                            Button {
                                tabSelection = true
                            } label: {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundStyle(tabSelection ? .main : .gray)
                                    .frame(width: scaleScreen_x(30), height: scaleScreen_x(30))
                            }
                            Spacer()
                        }
                    }
                    .ignoresSafeArea()
                    .frame(width: .infinity, height: scaleScreen_y(55))
                }
            }
            .onAppear(perform: {
                vmCollection.getHistory()
            })
            .sheet(isPresented: $vmCollection.isPresentAddEntry) {
                AddEntryView(vm: vmCollection)
            }
        }
    }
}

#Preview {
    MainView()
}
