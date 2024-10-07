//
//  AddNoteView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject var vm: NoteViewModel
    
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack{
                //MARK: - Title view
                Text("Add an entry")
                    .foregroundStyle(.white)
                    .font(.title)
                VStack{
                    //MARK: - Title note
                    VStack(alignment: .leading){
                        Text("Title")
                            .foregroundStyle(.gray)
                        CustomTextFieldView(text: $vm.simpleTitleNote)
                    }
                    //MARK: - Discript note
                    VStack(alignment: .leading){
                        Text("Description")
                            .foregroundStyle(.gray)
                        MultiLineTF(txt: $vm.simpleDescriptionNote, placehold: "Text")
                            .frame(height: scaleScreen_y(160))
                            .padding(8)
                            .background {
                                Color.white.opacity(0.05).cornerRadius(12)
                            }
                    }
                }
                .padding(10)
                .background {
                    Color.second
                        .cornerRadius(12)
                }
                Spacer()
                
                //MARK: - Save buttom
                Button {
                    if vm.isEdit{
                        vm.editNote()
                    }else{
                        vm.addNote()
                    }
                    
                } label: {
                    MainButtonView(text: "Save")
                }

            }.padding()
        }
    }
}

#Preview {
    AddNoteView(vm: NoteViewModel())
}
