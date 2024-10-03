//
//  AddEntryView.swift
//  Art Tracker
//
//  Created by Роман on 02.10.2024.
//

import SwiftUI

struct AddEntryView: View {
    @StateObject var vm: CollectionsViewModel
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.mainBack.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    //MARK: Label view
                    Text("Add an entry")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .heavy))
                    
                    VStack(alignment: .leading, spacing: 10){
                        //MARK: - Title work
                        Text("Title of the work")
                            .foregroundStyle(.gray)
                        CustomTextFieldView(placeholder: "Text", text: $vm.simpleTitle)
                        
                        HStack{
                            //MARK: Author
                            VStack(alignment: .leading){
                                Text("Author")
                                    .foregroundStyle(.gray)
                                CustomTextFieldView(placeholder: "Text", text: $vm.simpleAuthor)
                            }
                            //MARK: Date
                            VStack{
                                Text("Date")
                                    .foregroundStyle(.gray)
                                DatePicker("", selection: $vm.simpleDate, displayedComponents: .date)
                                    .colorScheme(.dark)
                            }
                        }
                        
                        //MARK: Dimensions
                        Text("Dimensions (height, width)")
                            .foregroundStyle(.gray)
                        CustomTextFieldView(placeholder: "00x00", text: $vm.simpleDesmensions)
                        
                        //MARK:  Category and Style
                        HStack{
                            VStack(alignment: .leading){
                                Text("Category")
                                    .foregroundStyle(.gray)
                                
                                    Picker("category", selection: $vm.simpleCategory){
                                        ForEach(Category.allCases) { category in
                                            Text(category.rawValue).foregroundStyle(.gray)
                                        }
                                    }
                                    .foregroundStyle(.gray)
                                    .pickerStyle(.menu)
                                    .padding(10)
                                    .background {
                                        Color.white
                                            .opacity(0.05)
                                            .cornerRadius(12)
                                    }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading){
                                Text("Style")
                                    .foregroundStyle(.gray)
                                Picker("Style", selection: $vm.simpleStyle){
                                    ForEach(Style.allCases) { category in
                                        Text(category.rawValue).foregroundStyle(.gray)
                                    }
                                }
                                .foregroundStyle(.gray)
                                .pickerStyle(.menu)
                                .padding(10)
                                .background {
                                    Color.white
                                        .opacity(0.05)
                                        .cornerRadius(12)
                                }
                            }
                        }.accentColor(.white)
                        
                        //MARK: Description
                        Text("Description")
                            .foregroundStyle(.gray)
                        MultiLineTF(txt: $vm.simpleDiscript, placehold: "Text")
                            .frame(height: scaleScreen_y(160))
                            .padding(10)
                            .background {
                                Color.white.opacity(0.05).cornerRadius(12)
                            }
                    }
                    .padding()
                    .background {
                        Color.second.cornerRadius(12)
                    }
                
                    
                    //MARK: - Materials
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Materials")
                            .foregroundStyle(.gray)
                        CustomTextFieldView(placeholder: "Text", text: $vm.simpleMaterials)
                    }
                    .padding()
                    .background {
                        Color.second.cornerRadius(12)
                    }
                    
                    //MARK: - Image
                        VStack{
                            Image(systemName: "photo.fill")
                                .resizable()
                                .frame(width: scaleScreen_x(32), height: scaleScreen_x(32))
                                .foregroundStyle(.gray)
                            Text("Add image")
                                .foregroundStyle(.gray)
                        }
                        .frame(height: scaleScreen_y(110))
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.second.cornerRadius(12)
                    }
                    
                    //MARK: - Save button
                    Button {
                        vm.isPresentAddEntry = false
                    } label: {
                        MainButtonView(text: "Save")
                    }
   
                }.padding(10)
            }
        }
    }
}

#Preview {
    AddEntryView(vm: CollectionsViewModel())
}
