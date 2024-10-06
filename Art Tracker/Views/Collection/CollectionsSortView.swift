//
//  CollectionsSortView.swift
//  Art Tracker
//
//  Created by Роман on 06.10.2024.
//

import SwiftUI

struct CollectionsSortView: View {
    @StateObject var vm: CollectionsViewModel
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.mainBack.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 15) {
                Text("Collection")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .heavy))
                
                //MARK: - Category sort
                VStack(alignment: .leading){
                    Text("Category")
                        .foregroundStyle(.gray)
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                vm.simpleSortCategory = nil
                                vm.sotedCollection()
                            } label: {
                                Text("All")
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background {
                                        Color(vm.simpleSortCategory == nil ? .main : .second)
                                            .cornerRadius(10)
                                    }
                            }
                            ForEach(Category.allCases) { category in
                                Button {
                                    vm.simpleSortCategory = category
                                    vm.sotedCollection()
                                } label: {
                                    Text(category.rawValue)
                                        .foregroundStyle(.white)
                                        .padding(8)
                                        .background {
                                            Color(vm.simpleSortCategory == category ? .main : .second)
                                                .cornerRadius(10)
                                        }
                                }
                            }
                        }
                    }
                }
                
                //MARK: - Style sort
                VStack(alignment: .leading){
                    Text("Style")
                        .foregroundStyle(.gray)
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                vm.simpleSortStyle = nil
                                vm.sotedCollection()
                            } label: {
                                Text("All")
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background {
                                        Color(vm.simpleSortStyle == nil ? .main : .second)
                                            .cornerRadius(10)
                                    }
                            }
                            ForEach(Style.allCases) { style in
                                Button {
                                    vm.simpleSortStyle = style
                                    vm.sotedCollection()
                                } label: {
                                    Text(style.rawValue)
                                        .foregroundStyle(.white)
                                        .padding(8)
                                        .background {
                                            Color(vm.simpleSortStyle == style ? .main : .second)
                                                .cornerRadius(10)
                                        }
                                }
                            }
                        }
                    }
                }
                
                //MARK: - Sorted Collection
                if vm.sortedCollection.isEmpty {
                    CollectionEmptyView()
                }else{
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(vm.sortedCollection) { entry in
                            EntryCellview(entry: entry)
                        }
                    }
                }
                Spacer()
            }.padding()
                .onAppear {
                    vm.sotedCollection()
                }
        }
    }
}

#Preview {
    CollectionsSortView(vm: CollectionsViewModel())
}
