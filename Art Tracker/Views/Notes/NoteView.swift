//
//  NoteView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct NoteView: View {
    @StateObject var vm: NoteViewModel
    @Environment(\.dismiss) var dismiss
    let note: Note
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack(alignment: .leading){
                Text(note.titleNote ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .heavy))
                Text(note.descriptNote ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                Spacer()
                Button {
                    vm.deleteNote(note: note)
                    dismiss()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.second)
                        Text("Delete")
                            .foregroundStyle(.white)
                            .font(.system(size: scaleScreen_x(17), weight: .bold))
                    }.frame(width: .infinity, height: scaleScreen_x(50))
                }

            }.padding()
                .toolbar {
                    ToolbarItem {
                        Button("Edit") {
                            vm.simpleNote = note
                            vm.fillData()
                            vm.isAddNote = true
                        }
                    }
                }
        }
    }
}

//#Preview {
//    NoteView(note: Note())
//}
