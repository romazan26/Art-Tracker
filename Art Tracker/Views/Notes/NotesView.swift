//
//  NotesView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct NotesView: View {
    @StateObject var vm: NoteViewModel
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack{
                HStack {
                    Text("Notes")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .heavy))
                    Spacer()
                }
                if vm.notes.isEmpty {
                    CollectionEmptyView()
                    Spacer()
                }else {
                    ScrollView(content: {
                        ForEach(vm.notes) { note in
                            ZStack(alignment: .topTrailing) {
                                NavigationLink {
                                    NoteView(vm: vm, note: note)
                                } label: {
                                    NoteCellView(note: note)
                                }

                                
                                Button {
                                    vm.simpleNote = note
                                    vm.fillData()
                                    vm.isAddNote = true
                                    vm.isEdit = true
                                } label: {
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .frame(width: scaleScreen_x(24), height: scaleScreen_x(24))
                                        .foregroundStyle(.main)
                                        
                                }.padding(5)

                            }
                        }
                    })
                }
                
                
            }
            .padding()
            .toolbar {
                ToolbarItem {
                    Button {
                        vm.isAddNote = true
                    } label: {
                        Text("Add")
                            .foregroundStyle(.white)
                            .padding(12)
                            .background(Color.second.cornerRadius(15))
                    }
                }
            }
        }
        .sheet(isPresented: $vm.isAddNote) {
            AddNoteView(vm: vm)
        }
    }
}

#Preview {
    NavigationView {
        NotesView(vm: NoteViewModel())
    }
}
